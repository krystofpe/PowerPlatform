If(
    Param("FormType") = "Gift" || Param("FormType") = "Gifts",
    GiftScreen,
    If(
        Param("FormType") = "Hospitality",
        HospitalityScreen,
        If(
            Param("FormType") = "Donation" || Param("FormType") = "Donations",
            DonationScreen,
            If(
                Param("FormType") = "Sponsorship" || Param("FormType") = "Sponsorships",
                SponsorhipScreen,
                HomeScreen
            )
        )
    )
)