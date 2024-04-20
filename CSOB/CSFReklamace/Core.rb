Concurrent(
    ClearCollect(
         colWeekChunk1;
         Sort('Výstup_CURA_KKO_Týden'; ID; Ascending)
     );
     ClearCollect(
         colWeekChunk2,
         Sort('Výstup_CURA_KKO_Týden'; ID; Descending)
     )
);
 ClearCollect(
     colWeek;
     colWeekChunk1;
     Filter(colWeekChunk2; Not(ID in colWeekChunk1.ID))
 );
Clear(colWeekChunk1);
Clear(colWeekChunk2);

ClearCollect(
    colPobockaCC;
    Distinct(
        Filter(
            'Přístupy - HUB';
            'Ředitel - Pobočka' = "martin2novak@csob.cz" Or 'Ředitel - HUB' = "mvojtaskova@csob.cz" Or Zástup = User().Email Or 'Zástup - Pobočka' = User().Email
        );
        CC
    )
);;
ClearCollect(
    colFilterCSI;
    {Name: "Pomlouvač"};
    {Name: "Advokát"};
    {Name: "Promotér"}
);;
ClearCollect(
    colMenu;
    Table(
        {
            MenuLabel: "Report - Týden";
            MenuIcon: Icon.DocumentWithContent;
            MenuScreenNavigate: Week;
            MenuID: 1;
            SubMenu: Table()
        };
        {
            MenuLabel: "Report - Měsíc";
            MenuIcon: Icon.ListScrollWatchlist;
            MenuScreenNavigate: Month;
            MenuID: 2;
            SubMenu: Table() 
        };
        {
            MenuLabel: "Report - CSF";
            MenuIcon: Icon.LogJournal;
            MenuScreenNavigate: Overview;
            MenuID: 3;
            SubMenu: Table()
        }
    )
)

#gallery on visible
Clear(colWeek);;
ForAll(
    colPobockaCC;
    Collect(
        colWeek;
        Filter(
            Výstup_CURA_KKO_Týden;
            pobocka_CC = Result
        )
    )
);;
Reset(input_search1)

#gallery filter
SortByColumns(
    Filter(
        colWeek;
        'Datum uzavření' >= dp_datumod.SelectedDate And 'Datum uzavření' <= dp_datumdo.SelectedDate;
        IsBlank(colCSIFilter) || IsEmpty(colCSIFilter) || 'CSI - Customer Satisfaction  Index' in colCSIFilter;
        //pobocka_CC in colPobockaCC;//
        IsBlank(cb_reklamace.Selected.Value) || IsEmpty(cb_reklamace.Selected.Value) || cb_reklamace.Selected.Value in 'Reklamace Manager';
        IsBlank(cb_zpracovano.Selected.Value) || IsEmpty(cb_zpracovano.Selected.Value) || cb_zpracovano.Selected.Value = Zpracováno;
        IsBlank(input_search1) || IsEmpty(input_search1) || input_search1.Text in pracovnik_jmeno || input_search1.Text in pracovnik_os_cislo || input_search1.Text in 'CURA Pobočka';
        IsBlank(cbx_pobocka.Selected.Result) || IsEmpty(cbx_pobocka.Selected.Result) || cbx_pobocka.Selected.Result in 'CURA Pobočka'
    );
    "field_30";
    If(
        SortDescending1;
        Descending;
        Ascending
    )
)

length(outputs('Vypíše_řádky_v_tabulce_2')?['body/value'])
take(skip(outputs('Vypíše_řádky_v_tabulce_2')?['body/value'], variables('countRow')), 5000)

take(skip(outputs('Vypíše_řádky_v_tabulce_2')?['body/value'], variables('countRow2')), 5000)

take(skip(outputs('Vypíše_řádky_v_tabulce')?['body/value'], variables('countRow')), 5000)

ClearCollect(
    colPobockaCC;
    Distinct(
        Filter(
            'Přístupy - HUB';
            OData__x0158_editel_x002d_Pobo_x010d_k = "martin2novak@csob.cz" Or field_8 = "mvojtaskova@csob.cz" Or Z_x00e1_stup = User().Email
        );
        field_2
    )
);;
ClearCollect(
    colWeek;
    Filter(
        Výstup_CURA_KKO_Týden;
        field_38 in colPobockaCC
    )
);;
ClearCollect(
    colMonth;
    Filter(
        Výstup_MHU_Měsíc;
        CC_schůzky in colPobockaCC
    )
);;
ClearCollect(
    colFilterCSI;
    {Name: "Pomlouvač"};
    {Name: "Advokát"};
    {Name: "Promotér"}
);;
ClearCollect(
    colWeek2;
    ForAll(
        Výstup_CURA_KKO_Týden;
        Filter(
            Výstup_CURA_KKO_Týden;
            field_38 in colPobockaCC
        )
    )
)

Patch(
    Nominace;
    BrowseUsers.Selected;
    {Po_x010d_et_x0020_hlas_x016f_: BrowseUsers.Selected.Po_x010d_et_x0020_hlas_x016f_ + 1}
);;
Set(
    varUser;
    LookUp(
        'Přístupy - VIP';
        Email = User().Email
    )
);;
Patch(
    'Přístupy - VIP';
    LookUp(
        'Přístupy - VIP';
        Email = User().Email
    );
    {
        'Udělené hlasy': Concatenate(
            varUser.'Udělené hlasy';
            "; ";
            BrowseUsers.Selected.Title
        );
        'Počet hlasů': varUser.'Počet hlasů' - 1
    }
);;

Notify("Hlas udělen."; Success; 1000);;

Back()

items('Vypíše_řádky_v_tabulce_2')?['CUID']
items('Vypíše_řádky_v_tabulce_2')?['datum_dotazovani']
items('Vypíše_řádky_v_tabulce')?['CC']


field_9 eq '' and field_20 eq '' and field_3 eq ''

length(outputs('Vypíše_řádky_v_tabulce_2')?['body/value'])
length(outputs('Vypíše_řádky_v_tabulce')?['body/value'])

And field_3 >= DateAdd(Now();-3; Months)
pobocka_CC in colPobockaCC;
CC_schuzky in colPobockaCC;


'Ředitel - Pobočka' = "martin2novak@csob.cz" Or 'Ředitel - HUB' = "mvojtaskova@csob.cz" Or Zástup = User().Email

#PopUp - Send - Visible
    If(varPopUp2 =  false; true; false)
#PopUp - Zastup - Visible
    If(varPopUp =  false; true; false)

#ClearCollect(colNotification; {colName: BrowseGallery2.AllItems.Title1; colID: BrowseGallery2.AllItems.ID1; colPoznamka: BrowseGallery2.AllItems.Poznámka; colReklamace: BrowseGallery2.AllItems.'Reklamace Manager'})
ClearCollect(
    colMail;
    Filter(
        colWeek;
        Zpracováno = "ANO"
    )
);;
If(
    User().Email in 'Přístupy - HUB'.field_8; #pokud to je ředitel pobočky, zástup ředitele pobočky, zástup ředitele hubu
    #    User().Email in 'Přístupy - HUB'.'Ředitel - Pobočka' Or User().Email in 'Přístupy - HUB'.Zástup Or User().Email in 'Přístupy - HUB'.'Zástup - Pobočka';

    Office365Outlook.SendEmailV2(
        "krystof.penka@gmail.com"; # LookUp('Přístupy - HUB'; User().Email in 'Ředitel - Pobočka'; 'Ředitel - HUB') & "mhudak@csob.cz"
        "POZOR:  Notifikace o změnách v reklamacích!";
        "Byly změněny tyto položky:" & Char(10) & Char(10) & Concat(
            colMail;
            "Jméno: " & monthName & Char(10) & "ID: " & monthID & Char(10) & monthCommentary & Char(10) & "Reklamace: " & 'Reklamace Manager' & Char(10) & Char(10)
        )
    );//pokud je to ředitel hubu
    Office365Outlook.SendEmailV2(
        "krystof.penka@gmail.com"; #mail na Matěje Hudáka 
        "POZOR:  Notifikace o změnách v reklamacích!";
        "Byly změněny tyto položky:" & Char(10) & Char(10) & Concat(
            colMail;
            "Jméno: " & monthName & Char(10) & "ID: " & monthID & Char(10) & monthCommentary & Char(10) & "Reklamace: " & 'Reklamace Manager' & Char(10) & Char(10)
        )
    )
);;
Notify(
    "Notifikace odeslána.";
    Success
);;
Set(
    varPopUp2;
    true
)  


@{items('Použít_u_každého')?['pobocka']}
@{items('Použít_u_každého_2')?['pobocka']}

Set(varUser; LookUp('Přístupy - VIP'; Lower(Email)=Lower(User().Email

varUser in 'Přístupy - HUB'.'Ředitel - HUB' Or varUser in 'Přístupy - HUB'.'Ředitel - Pobočka' Or varUser in 'Přístupy - HUB'.Admin Or varUser2 in 'Přístupy - HUB'.'Ředitel - HUB'
Or varUser2 in 'Přístupy - HUB'.'Ředitel - Pobočka' Or varUser2 in 'Přístupy - HUB'.Admin

Patch('Report - Žolík'; LookUp('Report - Žolík'; Title = varUserCC); {zolik_k_pouziti: LookUp('Report - Žolík'; Title = varUserCC).zolik_k_pouziti -1})

"Počet 'Žolíků' za Vaše CC " & "(" & varUserCC & ")" & ":"

Clear(colHub);;
ForAll(
    colPobockaCC;
    Collect(
        colHub;
        Filter(
            'Přístupy - HUB';
            CC = Result
        )
    )
)

"Pozice: " & If(
    varUser in colHub.'Ředitel - HUB'; //ředitelHUB
    "Ředitel - HUB " & "(" & LookUp(
        colHub;
        varUser in colHub.'Ředitel - HUB';
        HUB
    ) & "); "
) & If(
    varUser in colHub.Zástup; //zástupHUB
    " Zástup - HUB " & "(" & LookUp(
        colHub;
        varUser in colHub.Zástup;
        HUB
    ) & "); "
) & If(
    varUser in colHub.'Ředitel - Pobočka'; //ředitelPobočka
    "Ředitel - Pobočka " & "(" & LookUp(
        colHub;
        varUser in colHub.'Ředitel - Pobočka';
        Pobočka
    ) & "); "
) & If(
    varUser in colHub.'Zástup - Pobočka'; //zástuPobočka
    "Zástup - Pobočka " & "(" & LookUp(
        colHub;
        varUser in colHub.'Zástup - Pobočka';
        Pobočka
    ) & "); "
)

"Pozice: " & If(
    varUser in colHub.'Ředitel - HUB'; //ředitelHUB
    "Ředitel - HUB; "
) & If(
    varUser in colHub.Zástup; //zástupHUB
    " Zástup - HUB; ")
& If(
    varUser in colHub.'Ředitel - Pobočka'; //ředitelPobočka
    "Ředitel - Pobočka; "
) & If(
    varUser in colHub.'Zástup - Pobočka'; //zástupPobočka
    " Zástup - Pobočka; ")

ClearCollect(
    colConfig;
    {M365: showM365.Value};
    {Novinky: showNovinky.Value};
    {Aplikace: showApps.Value};
    {Planner: showPlanner.Value};
    {ToDo: showToDo.Value};
    {Outlook: showOutlook.Value};
    {Calendar: showCalendar.Value}
)

Clear(colConfig)

If(varColor = true; RGBA(141; 198; 63; Timer2.Value/Timer2.Duration); RGBA(70; 78; 184; Timer2.Value/Timer2.Duration))

If(gp_M365.Visible; M365Tutorials.X + M365Tutorials.Width + 50)

#parsing string to single attributes then lookup to datasource
"1234567891011121314"
Left(StringText; 3) = 123
Mid(StringText;4;4) = 4567
Mid(StringText;8;6) = 891011
Right(StringText;2) = 14

#update item //Nominace - "udělit hlas"
Set(
    varLoading;
    true
);;
Set(
    varUser;
    LookUp(
        'Přístupy - VIP';
        Title = User().Email
    )
);;
Set(
    varThisItemHlasy;
    LookUp(
        Nominace;
        Name = varRecord.Name
    ).'Počet hlasů'
);;
Patch(
    Nominace;
    LookUp(
        Nominace;
        Name = varRecord.Name
    );
    {'Počet hlasů': varThisItemHlasy + 1}
);;
Patch(
    'Přístupy - VIP';
    LookUp(
        'Přístupy - VIP';
        Title = User().Email
    );
    {
        Ud_x011b_len_x00e9_hlasy: Concatenate(
            varUser.Ud_x011b_len_x00e9_hlasy;
            "; ";
            varRecord.Name
        );
        Po_x010d_et_x0020_hlas_x016f_: varUser.Po_x010d_et_x0020_hlas_x016f_ - 1
    }
);;
Set(
    varHlasy;
    varHlasy - 1
);;
Notify(
    "Hlas udělen.";
    Success;
    4000
);;
Set(
    varUser;
    LookUp(
        'Přístupy - VIP';
        Title = User().Email
    )
);;
ClearCollect(
    colUserHlasy;
    Filter(
        Split(
            varUser.Ud_x011b_len_x00e9_hlasy;
            ";"
        );
        Trim(Result) = varRecord.Name
    )
);;
Set(
    varLoading;
    false
)

If(varPopUp3 = true; true; false)
@{items('Apply_to_each')?['CAMPAIGN_ID']}
@{items('Apply_to_each')?['BUNDLE']}


If(
    User().Email in colHub.'Ředitel - HUB' Or User().Email in colHub.Zástup;
    "Odeslat reklamace";
    "Odeslat ke schválení"
)

If(
    Lower(User().Email) in colHub.'Ředitel - HUB' Or Lower(User().Email) in colHub.Zástup;
    "Ke Zpracování";
    "Ke Schválení"
)


{
   '@odata.type': "#Microsoft.Azure.Connectors.SharePoint.SPListExpandedUser";
   Claims: "i:0#.f|membership|" & varUser.Email;
   Department: "";
   DisplayName: varUser.FullName;
   Email: varUser.Email;
   JobTitle: "";
   Picture: ""
}


ClearCollect(colTest; Filter('Přístupy - HUB'; 'Ředitel - Pobočka' = User().Email Or 'Zástup - Pobočka' = User().Email).CC);;
ClearCollect(colTestValue; ForAll(colTest; Filter('Report - Žolík'; Text(field_2) = Title)));;
ForAll(colTestValue; Collect(colTestCC; Value));;
//RenameColumns(ClearCollect(colTestColumns; ShowColumns(colTestCC; "Title"; "field_1")); "Title"; "CC"; "field_1"; "Počet žolíků")
ClearCollect(colTestColumns; ShowColumns(colTestCC; "Title"; "field_1"));;
ClearCollect(colSolution; ForAll(Distinct(colTestColumns; ThisRecord); Result))



//ClearCollect(colTest2; 'Report - Žolík');;
//ClearCollect(Test;ForAll(colTest; Filter(colTest2; Text(field_2) = Text(Title))));;
//ForAll(Test; RenameColumns(Collect(Temp; Value); "Title"; "NewTitle"));;
//ClearCollect(colFinal;ForAll(Temp; Filter(colTest2; Text(Title) = Text(Title))))


ClearCollect(
    colEmailCC;
    Filter(
        'Přístupy - HUB';
        'Ředitel - Pobočka' = User().Email Or 'Zástup - Pobočka' = User().Email
    ).CC
);;
ClearCollect(
    colEmailCCValue;
    ForAll(
        colEmailCC;
        Filter(
            'Report - Žolík';
            Text(CC) = Title
        )
    )
);;
ForAll(
    colEmailCCValue;
    Collect(
        colTestCC;
        Value
    )
);;
ClearCollect(
    colTestColumns;
    ShowColumns(
        colTestCC;
        "Title";
        "field_1"
    )
);;
ClearCollect(
    colSolutionEmail;
    ForAll(
        Distinct(
            colTestColumns;
            ThisRecord
        );
        Result
    )
);;
Office365Outlook.SendEmail(
    User().Email;
    "CSF Reklamace - Počet žolíků za CC";
    "Níže najdete výčet jednotlivých CC, u kterých jste veden jako vedoucí/zástup vedoucího pracovníka." & "<br>" & "<br>" & HtmlText2.HtmlText & "<br>" & "Tato zpráva byla vygenerována automaticky, neodpovídejte na ni." & "<br>" & "<br>" & "S pozdravem" & "<br>" &
"Tým Motivace";
    {IsHtml: true}
)