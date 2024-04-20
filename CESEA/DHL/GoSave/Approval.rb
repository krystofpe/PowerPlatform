If(
    CountRows(
        Filter(
            selectedItems,
            (WorkflowStatus.Value = "Not Started" || WorkflowStatus.Value = "Rejected" || WorkflowStatus.Value = "Rejected by CFO" || WorkflowStatus.Value = "Rejected by Controlling") && StartWorkflow = false
        )
    ) > 0,
    UpdateIf(
        Benefits,
        ThisRecord.ID in Filter(
            selectedItems,
            (WorkflowStatus.Value = "Not Started" || WorkflowStatus.Value = "Rejected" || WorkflowStatus.Value = "Rejected by CFO" || WorkflowStatus.Value = "Rejected by Controlling") && StartWorkflow = false
        ).ID,
        {StartWorkflow: true}
    );
    ForAll(
        Filter(
            Filter(
                Benefits,
                StartsWith(
                    'Record ID ',
                    varRecord.InitiativeIDCopy
                )
            ),
            ThisRecord.ID in selectedItems.ID
        ),
        Notify(
            ApprovalWF.Run(
                ID,
                varRecord.InitiativeIDCopy,
                User().Email,
                varRecord.ID
            ).info,
            NotificationType.Success,
            2000
        )
    );
    Clear(selectedItems);
    Refresh(Benefits),
    false
)

#ForAll(Filter(Filter(Benefits,StartsWith('Record ID ', varRecord.InitiativeIDCopy)),ThisRecord.ID in selectedItems.ID),Update(Benefits,LookUp(Benefits,ID=ID),{StartWorkflow:true});Notify(ApprovalWF.Run(ID,varRecord.InitiativeIDCopy,User().Email).info,NotificationType.Success,2000))