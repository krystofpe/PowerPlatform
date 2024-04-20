If(
    !vIsItem, #Form = New
    Set(
        vGHistoryText,
        Concatenate(
            Text(
                Now(),
                "dd/mm/yyyy hh:mm"
            ),
            " - ",
            User().FullName,
            " (Requestor) - The new Gift request has been submited"
        )
    );
    ClearCollect(
        patchedRecords,
        Patch(
            Gifts,
            Defaults(Gifts),
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
                Region: {Value: G_rgRegions.Selected.Value},
                Country: If(
                    G_rgRegions.Selected.Value = "GLOBAL" Or G_rgRegions.Selected.Value = "REGIONAL",
                    Blank(),
                    Dropdown1.SelectedText.Value
                ),
                'Request type': {Value: Radio2.Selected.Value},
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
                'Flow State': {Value: "New"},
                Entity: dd_Entity_1.Selected.EntityName,
                History: vGHistoryText
            },
            Form_Attachments.Updates
        )
    );
    Navigate(HomeScreen);
    Notify("New request has been submited.");
    ,
    If (
        vIsReturnedBack,
        If(
            vItemStatus = "Draft",
            Set(
                vGHistoryText,
                Concatenate(
                    DataCardValue42.Text,
                    Char(13),
                    Text(
                        Now(),
                        "dd/mm/yyyy hh:mm"
                    ),
                    " - ",
                    User().FullName,
                    " (Requestor) - The Gift request has been submited"
                )
            );
            Set(
                vGNextStatus,
                "New"
            );
            Set(
                vGTrigger,
                false
            ),
            Set(
                vGHistoryText,
                Concatenate(
                    DataCardValue42.Text,
                    Char(13),
                    Text(
                        Now(),
                        "dd/mm/yyyy hh:mm"
                    ),
                    " - ",
                    User().FullName,
                    " (Requestor) - The Gift request has been updated : ",
                    txtG_Comments.Text
                )
            );
            Set(
                vGNextStatus,
                vActiveTask.FlowPhase
            );
            Set(
                vGTrigger,
                true
            );
        );
        Patch(
            Gifts,
            LookUp(
                Gifts,
                ID = vGRecord.ID
            ),
            {
                Region: {Value: G_rgRegions.Selected.Value},
                Country: If(
                    G_rgRegions.Selected.Value = "GLOBAL" Or G_rgRegions.Selected.Value = "REGIONAL",
                    Blank(),
                    Dropdown1.SelectedText.Value
                ),
                'Request type': {Value: Radio2.Selected.Value},
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
                History: vGHistoryText,
                TriggerFlow: vGTrigger,
                'Flow State': {Value: vGNextStatus},
                Entity: dd_Entity_1.Selected.EntityName
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
                'Request type': Radio2.Selected,
                Country: If(
                    G_rgRegions.Selected.Value = "GLOBAL" Or G_rgRegions.Selected.Value = "REGIONAL",
                    Blank(),
                    Dropdown1.SelectedText.Value
                ),
                Region: G_rgRegions.Selected,
                History: vGHistoryText
            }
        );
        If(
            vItemStatus <> "Draft",
            Patch(
                ApprovalTasks,
                vTask,
                {Outcome: "Submit for approval"},
                {Comment: txtG_Comments.Text},
                {CompletedDate: Now()},
                {Status: {Value: "Submited for approval"}}
            )
        );
        Navigate(HomeScreen);
        Notify("Your changes has been saved.");
        ,
        Navigate(HomeScreen);
    )
);
ResetForm(Form)