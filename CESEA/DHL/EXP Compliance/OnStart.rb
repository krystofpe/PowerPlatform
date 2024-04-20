Set(
    vItemID,
    Param("ItemID")
);
If(
    !IsBlank(Param("ID")),
    Set(
        vItemID,
        Param("ID")
    )
);
Set(
    vFormType,
    Param("FormType")
);
Set(
    vTaskID,
    Param("TaskID")
);
Set(
    vIsApproval,
    false
);
Set(
    vIsReturnedBack,
    false
);
Set(
    vTaskForUser,
    false
);
Set(
    vCurrentUserEmail,
    User().Email
);
Set(
    vApproveOutcome,
    "Approve"
);
ClearCollect(
    colCountries,
    SortByColumns(
        Countries,
        "Title"
    )
);
ClearCollect(
    colRelationships,
    [
        "suppliers",
        "customers",
        "sub-contractors",
        "agents",
        "business partners",
        "others",
    ]
);
Set(
    organizationCounter,
    1
);
Set(
    H_organizationCounter,
    1
);
If(
    !IsBlank(vItemID) && !IsBlank(vFormType),
    Set(
        vIsItem,
        true
    );
    If(
        vFormType = "Gift" || vFormType = "Gifts",
        Set(
            vListName,
            "Gifts"
        );
        Set(
            vGRecord,
            LookUp(
                Gifts,
                ID = Value(vItemID)
            )
        );
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
        ForAll(
            ParseJSON(colOrganizationsJson),
            Collect(
                colTemp,
                {
                    id: Value(ThisRecord.id),
                    name: Text(ThisRecord.name),
                    recipient: Text(ThisRecord.recipient),
                    relationship: Text(ThisRecord.relationship),
                    spend: Text(ThisRecord.spend)
                }
            )
        );
        Set(
            vItemStatus,
            vGRecord.'Flow State'.Value
        );
        ,
        If(
            vFormType = "Donation" || vFormType = "Donations",
            Set(
                vListName,
                "Donations"
            );
            Set(
                vDRecord,
                LookUp(
                    Donations,
                    ID = Value(vItemID)
                )
            );
            ClearCollect(
                D_colFilteredCountries,
                Filter(
                    colCountries,
                    Region.Value = vDRecord.Region.Value
                )
            );
            Set(
                vItemStatus,
                vDRecord.'Flow State'.Value
            );
            ,
            If(
            vFormType = "Sponsorship" || vFormType = "Sponsorships",
            Set(
                vListName,
                "Sponsorships"
            );
            Set(
                vSRecord,
                LookUp(
                    Sponsorships,
                    ID = Value(vItemID)
                )
            );
            ClearCollect(
                S_colFilteredCountries,
                Filter(
                    colCountries,
                    Region.Value = vSRecord.Region.Value
                )
            );
            Set(
                vItemStatus,
                vSRecord.'Flow State'.Value
            )
            ,
            Set(
                vListName,
                "Hospitality"
            );
            Set(
                vHRecord,
                LookUp(
                    Hospitality,
                    ID = Value(vItemID)
                )
            );
            ClearCollect(
                H_colFilteredCountries,
                Filter(
                    colCountries,
                    Region.Value = vHRecord.Region.Value
                )
            );
            Set(
                vItemStatus,
                vHRecord.'Flow State'.Value
            );
            ClearCollect(
                H_colFilteredCountries,
                Filter(
                    colCountries,
                    Region.Value = vHRecord.Region.Value
                )
            );
            Set(
                H_colOrganizationsJson,
                vHRecord.Organizations
            );
            ForAll(
                ParseJSON(H_colOrganizationsJson),
                Collect(
                    H_colOrganizations,
                    {
                        id: Value(ThisRecord.id),
                        name: Text(ThisRecord.name),
                        recipient: Text(ThisRecord.recipient),
                        relationship: Text(ThisRecord.relationship),
                        spend: Text(ThisRecord.spend),
                        spouse: Text(ThisRecord.spouse)
                    }
                )
            );
            ForAll(
                ParseJSON(H_colOrganizationsJson),
                Collect(
                    H_colTemp,
                    {
                        id: Value(ThisRecord.id),
                        name: Text(ThisRecord.name),
                        recipient: Text(ThisRecord.recipient),
                        relationship: Text(ThisRecord.relationship),
                        spend: Text(ThisRecord.spend),
                        spouse: Text(ThisRecord.spouse)
                    }
                )
            );
        )
    )
    ),
    Set(
        vIsItem,
        false
    )
);
If(
    !IsBlank(Param("ID")),
    Set(
        vActiveTask,
        LookUp(
            ApprovalTasks,
            ListItemID = Value(Param("ID")) && Status.Value = "In progress" && SourceListName = vListName
        )
    );
    ,
    !IsBlank(vTaskID),
    Set(
        vActiveTask,
        LookUp(
            ApprovalTasks,
            ID = Value(vTaskID) && Status.Value = "In progress" && SourceListName = vListName
        )
    );
);
If(
    !IsBlank(vActiveTask),
    Set(
        vTaskID,
        Text(vActiveTask.ID)
    );
    ,
    Set(
        vTaskID,
        Blank()
    );
);
If(
    !IsBlank(vTaskID),
    Set(
        vIsTask,
        true
    ),
    Set(
        vIsTask,
        false
    )
);
If(
    vIsTask,
    Set(
        vTask,
        LookUp(
            ApprovalTasks,
            ID = Value(vTaskID)
        )
    )
);
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
);
If(
    vIsTask,
    ClearCollect(
        colOutcomes,
        LookUp(
            ApprovalTasks,
            ID = Value(vTaskID),
            PossibleOutcome
        )
    )
);
If (
    CountRows(colOutcomes) <> 0,
    Set(
        vApproveOutcome,
        First(colOutcomes).Value
    )
);
If(
    vIsTask,
    Set(
        vTaskForUser,
        If(
            CountRows(
                Filter(
                    colAssignedTo,
                    Lower(Email) = Lower(vCurrentUserEmail)
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