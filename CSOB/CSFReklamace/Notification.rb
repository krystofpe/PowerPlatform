Set(
    varSpinner2;
    true
);;
ClearCollect(
    colMail;
    Filter(
        galMonth.AllItems;
        Reklamace = "ANO"
    )
);;
If(
    varUser in colHub.'Ředitel - HUB';
    Office365Outlook.SendEmail(
        "motivaceRET@csob.cz";
        "Reklamace ke zpracování - HUB: " & LookUp(
            colHub;
            varUser = 'Ředitel - HUB';
            HUB
        );
        "Byly změněny tyto položky:" & Char(10) & Char(10) & Concat(
            colMail;
            "Jméno: " & '{Name}' & Char(10) & "ID: " & ID & Char(10) & "Poznámka: " & Pozn_x00e1_mka & Char(10) & "Reklamace: " & Reklamace & Char(10) & "Provést akci: " & Zm_x011b_na & Char(10) & "CUID: " & CUID & Char(10) & Char(10)
        ) & "Odkaz do aplikace: " & Char(10) & "https://apps.powerapps.com/play/b9a8d9e6-9577-4c32-8289-a3967a61a759?tenantId=64af2aee-7d6c-49ac-a409-192d3fee73b8" & Char(10) & Char(10) & "Zpráva o reklamacích CSF je generována automaticky, na tento e-mail neodpovídejte. " & Char(10) & Char(10) & "S pozdravem " & Char(10) & "Tým motivace"
    )
);;
If(
    varUser in colHub.Zástup;
    Office365Outlook.SendEmail(
        "motivaceRET@csob.cz";
        "Reklamace ke zpracování - HUB: " & LookUp(
            colHub;
            varUser = Zástup;
            HUB
        );
        "Byly změněny tyto položky:" & Char(10) & Char(10) & Concat(
            colMail;
            "Jméno: " & '{Name}' & Char(10) & "ID: " & ID & Char(10) & "Poznámka: " & Pozn_x00e1_mka & Char(10) & "Reklamace: " & Reklamace & Char(10) & "Provést akci: " & Zm_x011b_na & Char(10) & "CUID: " & CUID & Char(10) & Char(10)
        ) & "Odkaz do aplikace: " & Char(10) & "https://apps.powerapps.com/play/b9a8d9e6-9577-4c32-8289-a3967a61a759?tenantId=64af2aee-7d6c-49ac-a409-192d3fee73b8" & Char(10) & Char(10) & "Zpráva o reklamacích CSF je generována automaticky, na tento e-mail neodpovídejte. " & Char(10) & Char(10) & "S pozdravem " & Char(10) & "Tým motivace"
    )
);;
If(
    varUser in colHub.'Ředitel - Pobočka';
    Office365Outlook.SendEmail(
        LookUp(
            colHub;
            varUser = 'Ředitel - Pobočka';
            'Ředitel - HUB'//ředitelHUB
        );
            "Reklamace ke schválení za pobočku: " & LookUp(
                colHub;
                varUser = 'Ředitel - Pobočka';
                Pobočka// předmět zprávy na HUB ředitele
        );
        "Byly změněny tyto položky:" & Char(10) & Char(10) & Concat(
            colMail;
            "Jméno: " & '{Name}' & Char(10) & "ID: " & ID & Char(10) & "Poznámka: " & Pozn_x00e1_mka & Char(10) & "Reklamace: " & Reklamace & Char(10) & "Provést akci: " & Zm_x011b_na & Char(10) & "CUID: " & CUID & Char(10) & Char(10)
        ) & "Odkaz do aplikace: " & Char(10) & "https://apps.powerapps.com/play/b9a8d9e6-9577-4c32-8289-a3967a61a759?tenantId=64af2aee-7d6c-49ac-a409-192d3fee73b8" & Char(10) & Char(10) & "Zpráva o reklamacích CSF je generována automaticky, na tento e-mail neodpovídejte. " & Char(10) & Char(10) & "S pozdravem " & Char(10) & "Tým motivace";
        {
            Cc: LookUp(
                colHub;
                varUser = 'Ředitel - Pobočka';
                Zástup //kopie na zástup řediteleHUB
            ) #přidat kopii na zástup pobočky
        }
    )
);;
If(
    varUser in colHub.'Zástup - Pobočka';
    Office365Outlook.SendEmail(
        LookUp(
            colHub;
            varUser = 'Zástup - Pobočka';
            'Ředitel - HUB'//ředitelHUB
        );
            "Reklamace ke schválení za pobočku: " & LookUp(
                colHub;
                varUser = 'Zástup - Pobočka';
                Pobočka// předmět zprávy na HUB ředitele
        );
        "Byly změněny tyto položky:" & Char(10) & Char(10) & Concat(
            colMail;
            "Jméno: " & '{Name}' & Char(10) & "ID: " & ID & Char(10) & "Poznámka: " & Pozn_x00e1_mka & Char(10) & "Reklamace: " & Reklamace & Char(10) & "Provést akci: " & Zm_x011b_na & Char(10) & "CUID: " & CUID & Char(10) & Char(10)
        ) & "Odkaz do aplikace: " & Char(10) & "https://apps.powerapps.com/play/b9a8d9e6-9577-4c32-8289-a3967a61a759?tenantId=64af2aee-7d6c-49ac-a409-192d3fee73b8" & Char(10) & Char(10) & "Zpráva o reklamacích CSF je generována automaticky, na tento e-mail neodpovídejte. " & Char(10) & Char(10) & "S pozdravem " & Char(10) & "Tým motivace";
        {
            Cc: LookUp(
                colHub;
                varUser = 'Zástup - Pobočka';
                Zástup //kopie na zástup řediteleHUB 
                #& LookUp(colHub; varUser = 'Zástup - Pobočka'; 'Ředitel - Pobočka')
            ) #přidat kopii na ředitele pobočky
        }
    )
)
;;
UpdateIf(
    Výstup_MHU_Měsíc;
    CUID in colMail.CUID And Title in colMail.Title And datum_dotazovani in colMail.datum_dotazovani And trigger in colMail.trigger;
    {Odesl_x00e1_no_x002d_Pozice: If(Lower(User().Email) in 'Přístupy - HUB'.'Ředitel - HUB'; "ŘHUB"; "ŘP"); Odesl_x00e1_no: Lower(User().Email)}
);;
Notify(
    "Notifikace odeslána.";
    Success
);;
Set(
    varPopUp2;
    true
);;
Set(
    varSpinner2;
    false
)