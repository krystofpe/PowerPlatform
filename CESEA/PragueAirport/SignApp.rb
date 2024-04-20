PopulateWord.Run(
    {
        text: "Kryštof Pěnka",  #jmenoKlient
        text_1: "Test",         #společnost
        text_2: "Test",         #spz
        text_3: "Test",         #znacka/barva
        text_4: "Test",         #parkoviste
        text_5: "Test",         #telefon
        text_6: "Test",         #email
        text_7: "Test",         #datum [(]Text(Today(), "dd.mm.yyyy"))]
        text_8: JSON(           #podpisKlient
            input_Signature.Image,
            IncludeBinaryData
        ),
        text_9: "Test",         #vydanaKarta
        text_10: "Test",        #jmenoUser
        text_11: JSON(          #podpisUser
            input_Signature.Image,
            IncludeBinaryData
        )
    }
)

@{replace(json(triggerBody()['text_11']), 'data:image/png;base64,', '')}

ClearCollect(
    colMenu,
    Table(
        {
            MenuLabel: "HK",
            MenuIcon: Icon.AddDocument,
            MenuScreenNavigate: HK,
            MenuID: 1,
            SubMenu: Table()
        },
        {
            MenuLabel: "ZTP",
            MenuIcon: Icon.AddLibrary,
            MenuScreenNavigate: ZTP,
            MenuID: 2,
            SubMenu: Table()
        }
    )
)

#colors

RGBA(54, 176, 75, 1) - green
RGBA(237, 237, 237, 1)  -gray



Navigate(
    HK_Podpis,
    ScreenTransition.Cover
);
Set(
    varPopUp,
    false
)
#HK_onVisible

Reset(input_Jmeno);
Reset(input_SPZ);
Reset(input_ZnackaBarva);
Reset(input_Telefon);
Reset(format_Telefon);
Reset(lenNumber);
Set(varPhoneNumber, Blank());
Reset(input_Email);
Reset(input_CisloKarty);
Reset(cbx_input_Parkoviste)

#ZTP_onVisible

Reset(input_Jmeno_ZTP);
Reset(input_SPZ_ZTP);
Reset(input_ZnackaBarva_ZTP);
Reset(input_Telefon_ZTP);
Reset(format_Telefon_ZTP);
Reset(lenNumber_ZTP);
Set(varPhoneNumberZTP, Blank());
Reset(input_Email_ZTP);
Reset(input_Prukaz);
Reset(cbx_input_Parkoviste_ZTP);
Reset(input_Datum_ZTP);
Reset(input_Komentar_ZTP);
Reset(cbx_input_Listky)

#collectZTP
ClearCollect(colItem, Filter(ZTP_1, StartsWith('Jméno a příjmení', input_Jmeno_ZTP.Text)))

int(triggerBody()?['text_9'])

#testing/bugfixing
//Navigate(
//    Done_Success,
//    ScreenTransition.Cover
//);
//Set(
//    varSpinner,
//    true
//);
//Set(varStartTimer,true);

#prod



Set(
    varFileLink,
    LetištěPraha_PopulateWordTemplate_ZTP.Run(
        {
            text: If(!IsBlank(varItem), varItem.'Jméno a příjmení', input_Jmeno_ZTP.Text),
            text_1: If(!IsBlank(varItem), varItem.'Číslo průkazu', input_Prukaz.Text),
            text_2: If(!IsBlank(varItem), varItem.'RZ/SPZ', input_SPZ_ZTP.Text),
            text_3: If(!IsBlank(varItem), varItem.'Značka vozu a barva', input_ZnackaBarva_ZTP.Text),
            text_4: If(!IsBlank(varItem), varItem.Parkoviště.Value, Text(cbx_input_Parkoviste_ZTP.Selected.Value)),
            text_5: If(!IsBlank(varItem), varItem.Telefon, input_Telefon_ZTP.Text),
            text_6: If(!IsBlank(varItem), varItem.'E-mail', input_Email_ZTP.Text),
            text_7: Text(
                input_Datum_ZTP.SelectedDate,
                "dd.mm.yyyy"
            ),
            text_8: JSON(
                clientSignature_ZTP.Image,
                IncludeBinaryData
            ),
            text_9: If(!IsBlank(varItem), varItem.'Počet výjezdových lístků', Text(cbx_input_Listky.Selected.Value)),
            text_10: User().FullName,
            text_11: JSON(
                userSignature_ZTP.Image,
                IncludeBinaryData
            ),
            text_12: If(!IsBlank(varItem), varItem.Komentář, input_Komentar_ZTP.Text)
        }
    ).documentlinkztp
);


@{triggerBody()?['text_7']}

concat(split(outputs('Compose'),'.')[2],'-',split(outputs('Compose'),'.')[1],'-',split(outputs('Compose'),'.')[0])
concat(split(outputs('Compose'),'.')[2],'-',split(outputs('Compose'),'.')[1],'-',split(outputs('Compose'),'.')[0])
