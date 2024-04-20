Refresh('Platební příkazy');;
If(
    IsBlank(LookUp(
            'Platební příkazy';
            ID = ThisItem.ID).Zpracovatel.Email);
    Patch(
        'Platební příkazy';
        LookUp(
            'Platební příkazy';
            ID = ThisItem.ID
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
            'Datum přijetí':ThisItem.'Datum přijetí'
        }
    );
Collect(
    colDialogInstructions;
    {
        // -- Generic Popup Info -- //
        type: "Ok";
        message: "Je nám líto, ale tento případ má již přiřazený jiný pracovník. Přiřaďte si prosím jiný.";
        source: "ThisButton";
        iconType: Icon.Information;
        iconColor: Color.OrangeRed;
        // -- Input Type Configuration (REQUIRED if type = "input") -- //
        // -- Link Information (OPTIONAL) -- //
        // -- Response Section. (REQUIRED if you want to trigger an action) -- //
        responseAction: "RefreshVolnePripady";
        originalFunctionRequestID: Blank()
    }
)
);;

RGBA(184; 0; 0; 1) #darkred
RGBA(0; 94; 146; 1) #darkblue
RGBA(187; 221; 140; 1) #lightgreen
RGBA(250;216;112;1) #orange
RGBA(203;102;102;1) #lightred
RGBA(102;182;227;1) #ligthblue
RGBA(255;255;255;1) #white  
RGBA(255; 0; 0; 1) #light
RGBA(204; 204; 204; 1) #lightgray
RGBA(184; 0; 0; 1) #darkred

If(IsEmpty(EvidenceNumber.Text) Or IsBlank(EvidenceNumber.Text);RGBA(184; 0; 0; 1) ;RGBA(0; 94; 146; 1))
If(IsEmpty(EvidenceNumber.Text) Or IsBlank(EvidenceNumber.Text); "Evidenční číslo (Povinné)";"Evidenční číslo")


If(LookUp('Evidence příchozích požadavků'; 'Evidenční číslo' = ThisItem.'Evidenční číslo').Stav.Value = "Nový"; RGBA(255; 255; 255; 1); RGBA(184; 0; 0; 1))

If(CountRows(Filter(Registration7,Event="Agile ways of working"))>0,"Exist","Does Not Exist")

outputs('Vypíše_řádky_v_tabulce')?['CC']

field_8 eq '@{triggerBody()['text']}'

OData__x0158_editel_x002d_Pobo_x010d_k eq '@{triggerBody()['text']}'

[
    {
        "@odata.etag": "",
        "ItemInternalId": "5290319f-06d1-4860-abfa-0ea146627472",
        "CC": "9991",
        "Pobočka": "M365"
    },
    {
        "@odata.etag": "",
        "ItemInternalId": "bcd52851-64b3-40d5-86ef-31c484f384c1",
        "CC": "9992",
        "Pobočka": "CoE"
    }
]ß