@{triggerBody()?['file']?['name']}
@{triggerBody()['file']['contentBytes']}

Reset(AttachmentsForm);;
Reset(input_Firma);;
Reset(input_ICO);;
Reset(dp_Odesilatel);;
Reset(dp_kontaktCSOB);;
Reset(input_kontaktKlient);;
Reset(toggle_ICO);;
Reset(input_ICO_Zahranicni);;
Reset(input_Poznamka)


Refresh('Evidence příchozích požadavků');;
If(
    IsBlank(
        LookUp(
            'Evidence příchozích požadavků';
            'Evidenční číslo' = ThisItem.'Evidenční číslo'
        ).Zpracovatel.Email
    );
    Patch(
        'Evidence příchozích požadavků';
        LookUp(
            'Evidence příchozích požadavků';
            'Evidenční číslo' = ThisItem.'Evidenční číslo'
        );
        {
            Zpracovatel: {
                DisplayName: User().FullName;
                Claims: "i:0#.f|membership|" & Lower(User().Email);
                Department: "";
                Email: User().Email;
                JobTitle: "";
                Picture: ""
            };
            Stav: {Value: "Rozpracováno"}
        }
    );
    Set(
        varPopUpAlert;
        true
    )
);;
Refresh('Evidence příchozích požadavků')
;;
ClearCollect(colItems; Filter('Evidence příchozích požadavků'; Stav.Value = "Nový"))


Launch(LookUp('Dotazníky - Evidence'; 'Číslo případu' = varRecord.'Číslo případu').Přílohy.AbsoluteUri)

Office365Outlook.SendEmail(
    varRecord.Odesílatel.Email;
    "Notifikace o případu #" & varRecord.'Číslo případu' & ".";
    Switch(
        dp_Stav.Selected.Value;
        "Převzatý";
        "Váš požadavek byl převzat ke zpracování";
        "";
        "Váš požadavek byl převzat ke zpracování, je nicméně potřeba doplnit některé informace. Poznámka schvalovatele viz níže." & Char(10) & Char(10) & input_Revize.Text
    )
)

If(
    dp_Stav.Selected.Value = "Vrácený";
    Notify(
        "Změny v případu #" & varRecord.'Číslo případu' &" uloženy. Notifikace odeslána.";
        Notify(
            "Změny v případu #" & " uloženy.";
            Success
        )
    )
)


Refresh('Dotazníky - Evidence');;
Set(
    varItemIDAttachmets;
    LookUp(
        'Dotazníky - Evidence';
        'Číslo případu' = cislo_jednaci.Text
    ).ID
)