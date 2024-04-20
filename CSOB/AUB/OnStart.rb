# ZKONTROLOVAT PRI NASAZENI NA PRODUKCI, PRAVDEPODOBNE NEBUDE SEDET SKRZE JINY PRINCIPALNAME
If(
    Upper(User().Email) in Office365Groups.ListGroupMembers(LookUp('Environment Variable Values';'Environment Variable Definition'.'Display Name'="ADMINISTRATOR_ADGoup_ID").Value).value.userPrincipalName;
    Set(
        varUserRole;
        "Admin"
    );
    If(
        Upper(User().Email) in Office365Groups.ListGroupMembers(LookUp('Environment Variable Values';'Environment Variable Definition'.'Display Name'="ADVISOR_ADGroup_ID").Value).value.userPrincipalName;
        Set(
            varUserRole;
            "Advisor"
        );
        If(
            Upper(User().Email) in Office365Groups.ListGroupMembers(LookUp('Environment Variable Values';'Environment Variable Definition'.'Display Name'="LIMITHOLDER_ADGroup_ID").Value).value.userPrincipalName;
            Set(
                varUserRole;
                "Limitholder"
            );
            Set(
                varUserRole;
                "Reader"
            )
        )
    )
)