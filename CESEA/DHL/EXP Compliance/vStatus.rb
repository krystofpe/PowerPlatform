#vCurrentUserEmail - OK
Set(
    vCurrentUserEmail,
    User().Email
)

#vIsApproval
If(
    vIsTask,
    Set(
        vTaskForUser,
        If(
            CountRows(
                Filter(
                    colAssignedTo,
                    Email = vCurrentUserEmail
                )
            ) > 0,
            true,
            false
        )
    )
);
If(
    vIsTask && vItemStatus = "Back to author" && vTaskForUser,
    Set(
        vIsReturnedBack,
        true
    ),
    Set(
        vIsReturnedBack,
        false
    )
);
If(
    vIsTask && (vItemStatus = "Approval1" || vItemStatus = "Approval2" || vItemStatus = "Approval3") && vTaskForUser,
    Set(
        vIsApproval,
        true
    ),
    Set(
        vIsApproval,
        false
    )
)

#colAssignedTo
If(
    vIsTask,
    ClearCollect(
        colAssignedTo,
        LookUp(
            ApprovalTasks,
            ID = Value(vTaskID),
            AssignedTo
        )
    )
)