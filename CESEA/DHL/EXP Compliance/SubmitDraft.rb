If(
    vIsItem = false Or vIsItem = Blank(),
    Set(
        varGUID,
        GUID()
    );
    Patch(
        Gifts,
        Defaults(Gifts),
        {
            GUID: varGUID,
            Requestor: If(
                G_rgRequestor.Selected.Value = "Myself",
                {
                    DisplayName: User().FullName,
                    Claims: "i:0#.f|membership|" & Lower(User().Email),
                    Department: "",
                    Email: User().Email,
                    JobTitle: "",
                    Picture: ""
                },
                {
                    DisplayName: DataCardValue45.Selected.DisplayName,
                    Claims: "i:0#.f|membership|" & Lower(DataCardValue45.Selected.Email),
                    Department: "",
                    Email: Lower(DataCardValue45.Selected.Email),
                    JobTitle: "",
                    Picture: ""
                }
            ),
            Region: G_rgRegions.Selected,
            Country: Dropdown1.SelectedText.Value,
            'Request type': Radio2.Selected,
            Date: DateValue1.SelectedDate,
            Description: DataCardValue4.Text,
            Justification: DataCardValue5.Text,
            'Total value': Value(DataCardValue6.Text),
            'Number of recipients': Value(DataCardValue7.Text),
            'Total value per individual': Value(DataCardValue7_1.Text),
            Organizations: colOrganizationsJson,
            'Name of DHL employee': DataCardValue17.Text,
            'Gift only cash': If(
                DataCardValue11.Selected.Value = "Yes",
                true,
                false
            ),
            'Cash Equivalents': If(
                DataCardValue10.Selected.Value = "Yes",
                true,
                false
            ),
            'Cash equivalents justification': DataCardValue1.Text,
            'Gift solicited': If(
                DataCardValue8.Selected.Value = "Yes",
                true,
                false
            ),
            'Desire to influence': If(
                DataCardValue14.Selected.Value = "Yes",
                true,
                false
            ),
            'More than one occasion': If(
                DataCardValue27.Selected.Value = "Yes",
                true,
                false
            ),
            'Third party organisations': If(
                DataCardValue19.Selected.Value = "Yes",
                true,
                false
            ),
            'Further justification': DataCardValue21.Text,
            'Confirm superiors': cbIConfirmThatTheSuperiors.Value,
            'Confirm acceptation': cbIConfirmThatByAcceptingTheGift.Value,
            'Confirm no expectation': cbIConfirmThatThereWillBeNoExpectation.Value,
            Declaration: cbIDeclareThatTheInformation.Value,
            TriggerFlow: false,
            'Flow State': {Value: "Draft"},
            Entity: dd_Entity_1.Selected.EntityName,
            History: Text(
                Now(),
                "dd/mm/yyyy hh:mm"
            ) & " - " & User().FullName & " Draft has been created."
        },
        Form_Attachments.Updates
    );
    Patch(
        Gifts,
        LookUp(
            Gifts,
            GUID = Text(varGUID)
        ),
        {
            'Request type': Radio2.Selected,
            Country: If(
                G_rgRegions.Selected.Value = "GLOBAL" Or G_rgRegions.Selected.Value = "REGIONAL",
                Blank(),
                Dropdown1.SelectedText.Value
            ),
            Region: G_rgRegions.Selected,
            Organizations: colOrganizationsJson
        }
    );
    Refresh(Gifts);
    Set(
        vGRecord,
        LookUp(Gifts, GUID = Text(varGUID))
    );
    Set(
        vItemID,
        Text(
            LookUp(Gifts, GUID = Text(varGUID)).ID
        )
    );
    Set(
        vIsItem,
        true
    );
    /*
    ClearCollect(
        colFilteredCountries,
        Filter(
            colCountries,
            Region.Value = vGRecord.Region.Value
        )
    );
    Set(
        colOrganizationsJson,
        vGRecord.Organizations
    );
    ForAll(
        ParseJSON(colOrganizationsJson),
        Collect(
            colOrganizations,
            {
                id: Value(ThisRecord.id),
                name: Text(ThisRecord.name),
                recipient: Text(ThisRecord.recipient),
                relationship: Text(ThisRecord.relationship),
                spend: Text(ThisRecord.spend)
            }
        )
    );
    */
Notify("Draft has been saved."),
    Patch(
        Gifts,
        LookUp(
            Gifts,
            ID = vGRecord.ID
        ),
        {
            Region: G_rgRegions.Selected,
            Country: If(
                G_rgRegions.Selected.Value = "GLOBAL" Or G_rgRegions.Selected.Value = "REGIONAL",
                Blank(),
                Dropdown1.SelectedText.Value
            ),
            'Request type': Radio2.Selected,
            Date: DateValue1.SelectedDate,
            Description: DataCardValue4.Text,
            Justification: DataCardValue5.Text,
            'Total value': Value(DataCardValue6.Text),
            'Number of recipients': Value(DataCardValue7.Text),
            'Total value per individual': Value(DataCardValue7_1.Text),
            Organizations: colOrganizationsJson,
            'Name of DHL employee': DataCardValue17.Text,
            'Gift only cash': If(
                DataCardValue11.Selected.Value = "Yes",
                true,
                false
            ),
            'Cash Equivalents': If(
                DataCardValue10.Selected.Value = "Yes",
                true,
                false
            ),
            'Cash equivalents justification': DataCardValue1.Text,
            'Gift solicited': If(
                DataCardValue8.Selected.Value = "Yes",
                true,
                false
            ),
            'Desire to influence': If(
                DataCardValue14.Selected.Value = "Yes",
                true,
                false
            ),
            'More than one occasion': If(
                DataCardValue27.Selected.Value = "Yes",
                true,
                false
            ),
            'Third party organisations': If(
                DataCardValue19.Selected.Value = "Yes",
                true,
                false
            ),
            'Further justification': DataCardValue21.Text,
            'Confirm superiors': cbIConfirmThatTheSuperiors.Value,
            'Confirm acceptation': cbIConfirmThatByAcceptingTheGift.Value,
            'Confirm no expectation': cbIConfirmThatThereWillBeNoExpectation.Value,
            Declaration: cbIDeclareThatTheInformation.Value,
            TriggerFlow: false,
            'Flow State': {Value: "Draft"},
            History: Concatenate(
                vGRecord.History,
                Char(10),
                Text(
                    Now(),
                    "dd/mm/yyyy hh:mm"
                ) & " - " & User().FullName & " Draft has been updated."
            )
        },
        Form.Updates
    );
    Patch(
        Gifts,
        LookUp(
            Gifts,
            ID = vGRecord.ID
        ),
        {
            Requestor: If(
                G_rgRequestor.Selected.Value = "Myself",
                {
                    DisplayName: User().FullName,
                    Claims: "i:0#.f|membership|" & Lower(User().Email),
                    Department: "",
                    Email: User().Email,
                    JobTitle: "",
                    Picture: ""
                },
                {
                    DisplayName: DataCardValue45.Selected.DisplayName,
                    Claims: "i:0#.f|membership|" & Lower(DataCardValue45.Selected.Email),
                    Department: "",
                    Email: Lower(DataCardValue45.Selected.Email),
                    JobTitle: "",
                    Picture: ""
                }
            ),
            'Request type': Radio2.Selected,
            Country: If(
                G_rgRegions.Selected.Value = "GLOBAL" Or G_rgRegions.Selected.Value = "REGIONAL",
                Blank(),
                Dropdown1.SelectedText.Value
            ),
            Region: G_rgRegions.Selected,
            Organizations: colOrganizationsJson,
            History: Concatenate(
                vGRecord.History,
                Char(10),
                Text(
                    Now(),
                    "dd/mm/yyyy hh:mm"
                ) & " - " & User().FullName & " Draft has been updated."
            )
        }
    );
Notify("Your changes has been saved.")
);
Set(
    vGRecord,
    LookUp(
        Gifts,
        ID = vGRecord.ID
    )
);
Set(
    vIsItem,
    true
);
Set(
    vIsReturnedBack,
    true
);
Set(
    vItemStatus,
    "Draft"
)