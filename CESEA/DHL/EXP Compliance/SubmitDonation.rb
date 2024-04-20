If(
    !vIsItem,
    Set(
        vDTotalPerIndividual,
        Value(DataCardValue20.Text)
    );
    Set(
        vDHistoryText,
        Concatenate(
            Text(
                Now(),
                "dd/mm/yyyy hh:mm"
            ),
            " - ",
            User().FullName,
            " (Requestor) - The new Donation request has been created"
        )
    );
    Patch(
        Donations,
        Defaults(Donations),
        {
            Requestor: If(
                D_rgRequestor.Selected.Value = "Myself",
                {
                    DisplayName: User().FullName,
                    Claims: "i:0#.f|membership|" & Lower(User().Email),
                    Department: "",
                    Email: User().Email,
                    JobTitle: "",
                    Picture: ""
                },
                {
                    DisplayName: DataCardValue58.Selected.DisplayName,
                    Claims: "i:0#.f|membership|" & Lower(DataCardValue58.Selected.Email),
                    Department: "",
                    Email: Lower(DataCardValue58.Selected.Email),
                    JobTitle: "",
                    Picture: ""
                }
            ),
            Region: {Value: rgRegions.Selected.Value},
            Country: If(
                rgRegions.Selected.Value = "GLOBAL" Or rgRegions.Selected.Value = "REGIONAL" Or rgRegions.Selected.Value = "CN",
                Blank(),
                ddCountries.SelectedText.Value
            ),
            //ddCountries.SelectedText.Value,
            Date: DateValue2.SelectedDate,
            'Donation linked to program': {Value: DataCardValue43.Selected.Value},
            Description: DataCardValue37.Text,
            Justification: DataCardValue31.Text,
            'Total value': Value(DataCardValue20.Text),
            'Number of recipients': 1,
            'Total value per individual': Value(DataCardValue20.Text),
            'Type of donation - Cash': If(
                DataCardValue44.Selected.Value = "Cash",
                true,
                false
            ),
            'Type of donation - Only once': If(
                DataCardValue39.Selected.Value = "Once only",
                true,
                false
            ),
            'Has any donation previous months': If(
                DataCardValue47.Selected.Value = "Yes",
                true,
                false
            ),
            'Provide justification': DataCardValue24.Text,
            'Name of third party': DataCardValue29.Text,
            'Name and job of individuals': DataCardValue30.Text,
            'Third party NonProfit': If(
                DataCardValue50.Selected.Value = "Yes",
                true,
                false
            ),
            'Justification for NotRegistered or NonProfit': DataCardValue23.Text,
            'Tied to existing partners': If(
                DataCardValue49.Selected.Value = "Yes",
                true,
                false
            ),
            'Further justification for making business partners': DataCardValue28.Text,
            'Recipient is Public Organization': If(
                DataCardValue48.Selected.Value = "Yes",
                true,
                false
            ),
            'Justification for Public Organization': DataCardValue25.Text,
            'Confirm declaration': cbDonation_IDeclare.Value,
            TriggerFlow: true,
            'Flow State': {Value: "Approval1"},
            Entity: D_dd_Entity.Selected.EntityName,
            History: vDHistoryText
        },
        DAttachmentsForm.Updates
    );
    Navigate(HomeScreen);
    Notify("Your request has been created.");
    ,
    Set(
        vDTotalPerIndividual,
        Value(DataCardValue20.Text)
    );
    Set(
        vDHistoryText,
        Concatenate(
            DataCardValue46.Text,
            Char(13),
            Text(
                Now(),
                "dd/mm/yyyy hh:mm"
            ),
            " - ",
            User().FullName,
            " (Requestor) - The Donation request has been updated : ",
            txtD_Comments.Text
        )
    );
    If (
        vIsReturnedBack,
        If(
            vItemStatus = "Draft",
            Set(
                vDHistoryText,
                Concatenate(
                    DataCardValue46.Text,
                    Char(13),
                    Text(
                        Now(),
                        "dd/mm/yyyy hh:mm"
                    ),
                    " - ",
                    User().FullName,
                    " (Requestor) - The Donation request has been submited"
                )
            );
            Set(
                vDNextStatus,
                "New"
            );
            Set(
                vDTrigger,
                false
            ),
            Set(
                vDHistoryText,
                Concatenate(
                    DataCardValue46.Text,
                    Char(13),
                    Text(
                        Now(),
                        "dd/mm/yyyy hh:mm"
                    ),
                    " - ",
                    User().FullName,
                    " (Requestor) - The Donation request has been updated : ",
                    txtG_Comments.Text
                )
            );
            Set(
                vDNextStatus,
                vActiveTask.FlowPhase
            );
            Set(
                vDTrigger,
                true
            )
        );
        Patch(
            Donations,
            vDRecord,
            {
                Region: {Value: rgRegions.Selected.Value},
                Country: If(
                    rgRegions.Selected.Value = "GLOBAL" Or rgRegions.Selected.Value = "REGIONAL" Or rgRegions.Selected.Value = "CN",
                    Blank(),
                    ddCountries.SelectedText.Value
                ),
                Date: DateValue2.SelectedDate,
                'Donation linked to program': {Value: DataCardValue43.Selected.Value},
                Description: DataCardValue37.Text,
                Justification: DataCardValue31.Text,
                'Total value': Value(DataCardValue20.Text),
                'Number of recipients': 1,
                'Total value per individual': Value(DataCardValue20.Text),
                'Type of donation - Cash': If(
                    DataCardValue44.Selected.Value = "Cash",
                    true,
                    false
                ),
                'Type of donation - Only once': If(
                    DataCardValue39.Selected.Value = "Once only",
                    true,
                    false
                ),
                'Has any donation previous months': If(
                    DataCardValue47.Selected.Value = "Yes",
                    true,
                    false
                ),
                'Provide justification': DataCardValue24.Text,
                'Name of third party': DataCardValue29.Text,
                'Name and job of individuals': DataCardValue30.Text,
                'Third party NonProfit': If(
                    DataCardValue50.Selected.Value = "Yes",
                    true,
                    false
                ),
                'Justification for NotRegistered or NonProfit': DataCardValue23.Text,
                'Tied to existing partners': If(
                    DataCardValue49.Selected.Value = "Yes",
                    true,
                    false
                ),
                'Further justification for making business partners': DataCardValue28.Text,
                'Recipient is Public Organization': If(
                    DataCardValue48.Selected.Value = "Yes",
                    true,
                    false
                ),
                'Justification for Public Organization': DataCardValue25.Text,
                'Confirm declaration': cbDonation_IDeclare.Value,
                TriggerFlow: true,
                'Flow State': {Value: "Approval1"},
                Entity: D_dd_Entity.Selected.EntityName,
                History: vDHistoryText
            },
            DAttachmentsForm.Updates
        );
        If(
            vItemStatus <> "Draft",
            Patch(
                ApprovalTasks,
                vTask,
                {Outcome: "Submit for approval"},
                {Comment: txtD_Comments.Text},
                {CompletedDate: Now()},
                {Status: {Value: "Submited for approval"}}
            )
        );
        Navigate(HomeScreen);
        Notify("Your request has been updated.");
    )
);
ResetForm(DonationForm)