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


#změna identity

Set(
    varSpinner;
    true
);;
Patch(
        'Dotazníky - Evidence';
        LookUp(
            'Dotazníky - Evidence';
            Title = ThisItem.'Číslo případu'
        );
        {
            Schvalovatel: {
                DisplayName: dp_Resitel.Selected.DisplayName;
                Claims: "i:0#.f|membership|" & Lower(dp_Resitel.Selected.Mail);
                Department: "";
                Email: dp_Resitel.Selected.Mail;
                JobTitle: "";
                Picture: ""
            };
            Stav: {Value: "Převzatý"};
            'Stav - Schváleno': {Value: "V procesu schválení"}
        }
);;



####################################
Refresh('Dotazníky - Evidence');;
ClearCollect(
    colItems;
    'Dotazníky - Evidence'
);;
Set(
    varSpinner;
    false
)

;;
Set(
    varItemIDAttachmets;
    LookUp(
        'Dotazníky - Evidence';
        'Číslo případu' = cislo_jednaci.Text
    ).ID
);;
Dotazník_Upload_Attachment.Run(
    varItemIDAttachmets;
    user_email.Text;
    cislo_jednaci.Text;
    {
        file: {
            contentBytes: First(AttachmentsForm.Attachments).Value;
            name: First(AttachmentsForm.Attachments).Name
        }
    }
);;
Set(
    varPopUp;
    false
);;
Set(
    varSpinner;
    false
);;
Notify(
    "Případ #" & cislo_jednaci.Text & " byl zaevidován a předán ke schválení.";
    Success
);;
Set(
    varItemIDAttachmets;
    Blank()
);;
Reset(AttachmentsForm);;
    Reset(input_Firma);;
        Reset(input_ICO);;
            Reset(dp_Odesilatel);;
                Reset(dp_kontaktCSOB);;
                    Reset(input_kontaktKlient);;
                        Reset(toggle_ICO);;
                            Reset(input_ICO_Zahranicni);;
                                Reset(toggle_ICO_Null);;
                                    Reset(input_Poznamka);;
                                        Reset('input_Stat/Region');;
Navigate(HomeScreen; ScreenTransition.Fade)

addDays(formatDateTime(utcNow(), 'dd.MM.yyyy'), 30)

formatDateTime(utcNow(), 'dd.MM.yyyy')
addDays(formatDateTime(utcNow(), 'dd.MM.yyyy'), 30)

Set(
    varSpinner;
    true
);;
Refresh('Dotazníky - Evidence');;
ClearCollect(
    colMyItems;
    Filter(
        'Dotazníky - Evidence';
        Schvalovatel.DisplayName = Lower(User().FullName)
    )
);;
Set(
    varSpinner;
    false
)
###
Set(
    varSpinner;
    true
);;
Refresh('Dotazníky - Evidence');;
ClearCollect(
    colMyItems;
    Filter(
        'Dotazníky - Evidence';
        Lower(Schvalovatel.DisplayName) = Lower(User().FullName) And Stav.Value Or "Stornovaný"
    )
);;
Set(
    varSpinner;
    false
)

If(varRecord.Stav.Value = "Stornovaný" Or varRecord.Stav.Value = "Dokončený"; true; false)

------------------------------------------------------------------------------------------------------------

If(
    dp_Stav.Selected.Value = "Dokončený" Or dp_Stav.Selected.Value = "Stornovaný";
    Dotazník_Notification_Completed.Run(
        {
            text: varRecord.Odesílatel.Email;
            text_1: varRecord.'Název společnost';
            text_2: dp_Stav.Selected.Value;
            text_3: User().FullName;
            text_4: input_Revize.Text;
            text_5: varRecord.'Číslo případu';
            text_6: varRecord.Pobočka;
            text_7: varRecord.'Pobočka - Mail'
        }
    );
    Dotazník_Notification_ToBeEdited.Run(
        {
            text: varRecord.Odesílatel.Email;
            text_1: varRecord.'Číslo případu';
            text_2: varRecord.'Název společnost';
            text_3: varRecord.IČO;
            text_4: "Contact";
            //varRecord.'Kontakt - ČSOB'.DisplayName;
            text_5: "Country"//varRecord.'Stát/Region'
        }
    )
);;
If(
    Len(dp_kontaktCSOB_1.Selected.Mail) = 0;
    Patch(
        'Dotazníky - Evidence';
        LookUp(
        'Dotazníky - Evidence';
        'Číslo případu' = varRecord.'Číslo případu'
    );
        {
            'Číslo případu': varRecord.'Číslo případu';
            Datum: varRecord.Datum;
            Stav: {Value: "Vrácený"};
            'Kontakt - Klient': input_kontaktKlient_1.Text;
            IČO: input_ICO_1.Text;
            'Zahraniční IČO': input_ICO_Zahranicni_1.Text;
            Poznámka: Concatenate(
                varRecord.Poznámka;
                "; ";
                input_Poznamka_2.Text
            );
        }
    );
    {
        'Číslo případu': varRecord.'Číslo případu';
        Datum: varRecord.Datum;
        Stav: {Value: "Vrácený"};
        'Kontakt - ČSOB': {
            DisplayName: dp_kontaktCSOB_1.Selected.DisplayName;
            Claims: "i:0#.f|membership|" & Lower(lb_kontaktCSOBmail);
            Department: "";
            Email: Lower(lb_kontaktCSOBmail);
            JobTitle: "";
            Picture: ""
        };
        'Kontakt - Klient': input_kontaktKlient_1.Text;
        IČO: input_ICO_1.Text;
        'Zahraniční IČO': input_ICO_Zahranicni_1.Text;
        Poznámka: Concatenate(
            varRecord.Poznámka;
            "; ";
            input_Poznamka_2.Text
        );
    }
);;
If(
    Len(dp_kontaktCSOB.Selected.Mail) = 0;
    Patch(
        'Dotazníky - Evidence';
        Defaults('Dotazníky - Evidence');
        {
            'Číslo případu': cislo_jednaci.Text;
            Datum: Today();
            Stav: {Value: "Nový"};
            // 'Stav - Schváleno': {Value: "V procesu schválení"};
            Odesílatel: {
                DisplayName: User().FullName;
                Claims: "i:0#.f|membership|" & Lower(User().Email);
                Department: "";
                Email: User().Email;
                JobTitle: "";
                Picture: ""
            };
            'Kontakt - Klient': input_kontaktKlient.Text;
            'Měny - Zamítnuto': "";
            'Název společnost': input_Firma.Text;
            IČO: input_ICO.Text;
            'Zahraniční IČO': If(
                toggle_ICO.Value = true;
                input_ICO.Text
            );
            Žadatel: {
                DisplayName: User().FullName;
                Claims: "i:0#.f|membership|" & Lower(User().Email);
                Department: "";
                Email: User().Email;
                JobTitle: "";
                Picture: ""
            };
            'Oddělení žadatele': UživateléOffice365.UserProfileV2(User().Email).department;
            Poznámka: input_Poznamka.Text;
            'Stát/Region': 'input_Stat/Region'.Text
        }
    );
        Patch(
            'Dotazníky - Evidence';
            Defaults('Dotazníky - Evidence');
            {
                'Číslo případu': cislo_jednaci.Text;
                Datum: Today();
                Stav: {Value: "Nový"};
                // 'Stav - Schváleno': {Value: "V procesu schválení"};
                Odesílatel: {
                    DisplayName: User().FullName;
                    Claims: "i:0#.f|membership|" & Lower(User().Email);
                    Department: "";
                    Email: User().Email;
                    JobTitle: "";
                    Picture: ""
                };
                'Kontakt - ČSOB': {
                    DisplayName: dp_kontaktCSOB.Selected.DisplayName;
                    Claims: "i:0#.f|membership|" & Lower(dp_kontaktCSOB.Selected.Mail);
                    Department: "";
                    Email: Lower(dp_kontaktCSOB.Selected.Mail);
                    JobTitle: "";
                    Picture: ""
                };
                'Kontakt - Klient': input_kontaktKlient.Text;
                'Měny - Zamítnuto': "";
                'Název společnost': input_Firma.Text;
                IČO: input_ICO.Text;
                'Zahraniční IČO': If(
                    toggle_ICO.Value = true;
                    input_ICO.Text
                );
                Žadatel: {
                    DisplayName: User().FullName;
                    Claims: "i:0#.f|membership|" & Lower(User().Email);
                    Department: "";
                    Email: User().Email;
                    JobTitle: "";
                    Picture: ""
                };
                'Oddělení žadatele': UživateléOffice365.UserProfileV2(User().Email).department;
                Poznámka: input_Poznamka.Text;
                'Stát/Region': 'input_Stat/Region'.Text
            }
        )
    );;
Office365Outlook.SendEmail(
        Lower(varRecord.Odesílatel.Email);
        "Notifikace o případu #" & varRecord.'Číslo případu' & ".";
        "Váš požadavek byl převzat ke zpracování, je nicméně potřeba doplnit některé informace." & Char(10) & Char(10) & "Komentář schvalovatele viz níže:" & Char(10) & input_Revize.Text & Char(10) & Char(10) & "Odsouhlaseno k otevření: " & If(toggle_Odsouhlaseno.Value = true; "Ano"; "Ne") & Char(10) & "Jen CZK: " & If(toggle_JenCZK.Value = true; "Ano"; "Ne") & Char(10) & "EPO: " & If(toggle_EPO.Value = true; "Ano"; "Ne") & Char(10) & "Změna vlastnické struktury: " & If(toggle_Změna.Value = true; "Ano"; "Ne") & Char(10) & "CZK v komeptenci pobočky: " & If(toggle_KompetenceCZK.Value = true; "Ano"; "Ne") & Char(10) & "Zamítnuté měny: " & input_měny.Text & Char(10) & Char(10) & Char(10) & "Odkaz do aplikace: " & "https://apps.powerapps.com/play/cbcb59e5-5cd0-42d9-9aee-301643c1ca74?tenantId=64af2aee-7d6c-49ac-a409-192d3fee73b8"  & Char(10) & "Odkaz na položku: " & "https://kbcgroup.sharepoint.com/sites/csob-aplikace/220042/Lists/Dotaznky%20%20Evidence/Attachments/" & "/" & varRecord.ID & "/" & Substitute(Last(AttachmentsForm.Attachments).Name; " "; "%20") &
        Char(10) & Char(10) & "Tato zpráva byla vygenerována automaticky, neodpovídejte na ní."
        //{
          //  Attachments: AddColumns(RenameColumns(AttachmentsForm.Attachments; "Value"; "ContentBytes"); "@odata.type"; "")
        //}
    )
;;


If(
    dp_Stav.Selected.Value = "Dokončený" Or "Stornovaný";
    Office365Outlook.SendEmail(
        Lower(varRecord.Odesílatel.Email);
        "Notifikace o případu #" & varRecord.'Číslo případu' & ".";
        Switch(
            dp_Stav.Selected.Value;
            "Dokončený";
            "Váš případ #" & varRecord.'Číslo případu' & " byl dokončen." & Char(10) & Char(10) & "Tato zpráva byla vygenerována automaticky, neodpovídejte na ní.";
            "Stornovaný";
            "Váš případ #" & varRecord.'Číslo případu' & " byl stornován." & Char(10) & Char(10) & "Tato zpráva byla vygenerována automaticky, neodpovídejte na ní."
        )
    )
)

Dotazník_Notification_ToBeEdited.Run(
    {
        text_1: User().Email;
        text_2: varRecord.'Číslo případu';
        text_3: varRecord.'Název společnost';
        text_4: varRecord.IČO;
        text_5: varRecord.'Kontakt - ČSOB'.DisplayName;
        text_6: varRecord.'Stát/Region'
    }
)

If(
    dp_Stav.Selected.Value = "Dokončený" Or dp_Stav.Selected.Value = "Stornováný";
    Dotazník_Notification_Completed.Run(
        {
         text: varRecord.Odesílatel.Email;
         text_1: varRecord.'Název společnost';
         text_2: dp_Stav.Selected.Value;
         text_3: User().FullName;
         text_4: "";
         text_5: varRecord.'Číslo případu' 
        }
    ); 
    Dotazník_Notification_ToBeEdited.Run(
    {
        text: varRecord.Odesílatel.Email;
        text_1: varRecord.'Číslo případu';
        text_2: varRecord.'Název společnost';
        text_3: varRecord.IČO;
        text_4: "Contact"; //varRecord.'Kontakt - ČSOB'.DisplayName;
        text_5: "Country" //varRecord.'Stát/Region'
    }
)
);;
Patch(
    'Dotazníky - Evidence';
    LookUp(
        'Dotazníky - Evidence';
        'Číslo případu' = varRecord.'Číslo případu'
    );
    {
        'Číslo případu': varRecord.'Číslo případu';
        Datum: varRecord.Datum;
        Stav: {Value: "Vrácený"};
        'Stav - Schváleno': {Value: "V procesu schválení"};
        'Kontakt - ČSOB': {
            DisplayName: dp_kontaktCSOB_1.Selected.DisplayName;
            Claims: "i:0#.f|membership|" & Lower(lb_kontaktCSOBmail);
            Department: "";
            Email: Lower(lb_kontaktCSOBmail);
            JobTitle: "";
            Picture: ""
        };
        'Kontakt - Klient': input_kontaktKlient_1.Text;
        'Měny - Zamítnuto': varRecord.'Měny - Zamítnuto';
        'Název společnost': varRecord.'Název společnost';
        IČO: input_ICO_1.Text;
        'Zahraniční IČO': input_ICO_Zahranicni_1.Text;
        Poznámka: Concatenate(
            varRecord.Poznámka;
            "; ";
            input_Poznamka_2.Text
        )
    }
)