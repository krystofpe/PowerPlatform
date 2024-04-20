Set(
    varGenerating;
    true
);;
ClearCollect(
    colOrderItemsEdited;
    ForAll(
        galleryOrderItems.AllItems;
        Substitute(
            Substitute(
                Substitute(
                    ThisRecord.Result;
                    "#" & assetTagOld.Text;
                    Text(cb_assetTag.Selected.Result)//inputAssetTag.Text
                );
                "&" & serialNumberOld.Text;
                Text(cb_serialNumber.Selected.Result)//inputSerialNumber.Text
            );
            "$";
            ""
        )
    )
);;
Set(
    varString;
    Concat(
        colOrderItemsEdited;
        ThisRecord.Value
    )
);;
Set(
    varFileLink;
    PowerFAM_GenerateOrder.Run(
        {
            text: varOrder.'VS/Smlouva';
            text_1: varOrder.Objednal.DisplayName;
            text_2: varOrder.Bydliště;
            text_4: varOrder.'Celková cena';
            text_3: varString;
            text_5: varOrder.Objednal.Email
        }
    ).link
);;
ForAll(
    galleryOrderItems.AllItems;
    Patch(
        Evidence;
        LookUp(
            Evidence;
            'Inventární číslo' = assetTagOld.Text
        );
        {
            Objednal: First(Evidence).BlankPerson;
            'Osobní číslo': "";
            Příjmení: "";
            Jméno: "";
            Bydliště: "";
            'E-mail': "";
            Telefon: "";
            'Číslo smlouvy/Variabilní symbol': "";
            Status: {Value: "Volné"}
        }
    )
);;
ForAll(
    galleryOrderItems.AllItems;
    Patch(
        Evidence;
        LookUp(
            Evidence;
            'Inventární číslo' = Text(cb_assetTag.Selected.Result)
        );
        {
            Objednal: {
                DisplayName: varOrder.Objednal.DisplayName;
                Claims: "i:0#.f|membership|" & Lower(varOrder.Objednal.Email);
                Department: "";
                Email: Lower(varOrder.Objednal.Email);
                JobTitle: "";
                Picture: ""
            };
            'Osobní číslo': varOrder.'Osobní číslo';
            Příjmení: varOrder.Příjmení;
            Jméno: varOrder.Jméno;
            Bydliště: varOrder.Bydliště;
            'E-mail': varOrder.'E-mail';
            Telefon: varOrder.Telefon;
            'Číslo smlouvy/Variabilní symbol': varOrder.'VS/Smlouva';
            Status: {Value: "Prodáno"}
        }
    )
);;
Patch(
    PowerFAM_Evidence_Orders;
    LookUp(
        PowerFAM_Evidence_Orders;
        GUID = varOrder.GUID
    );
    {Status: {Value: "Prodáno"}}
);;
Set(
    varGenerating;
    false
);;
Set(
    varDownload;
    true
)