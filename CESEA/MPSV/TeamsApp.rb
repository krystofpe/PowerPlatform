            
            
ForAll(cbPeople.SelectedItems,
    Collect(
        colPeopleToPatch,     
            {
                '@odata.type': "#Microsoft.Azure.Connectors.SharePoint.SPListExpandUser",
                Claims: "i:0#.f|membership|" & ThisRecord.Mail,
                DisplayName: ThisRecord.DisplayName,
                Department: "",
                Email: ThisRecord.Mail,
                JobTitle: "",
                Picture: ""
            }
    )
)


RGBA(70, 78, 184, 1)

ForAll(
    AttachmentsForm.Attachments As Document;
    Dotazník_Upload_Attachment.Run(
        varItemIDAttachmets;
        user_email.Text;
        cislo_jednaci.Text;
        input_Firma.Text;
        input_ICO.Text;
        dp_Odesilatel.Selected.DisplayName;
        dp_Stat.Selected.Název;
        {
            file: {
                contentBytes: Document.Value;
                name: Document.Name
            }
        }
    )
)


@{triggerBody()?['file']?['name']}
@{triggerBody()['file']['contentBytes']}

ThisItem.Status.Value

Text(ThisItem.Uzávěrka, "dd.mm.yyyy")

Switch(
    ThisItem.Status.Value,
    "Ke zpracování",
    RGBA(
        250,
        216,
        112,
        1
    ),
    "Neschváleno",
    RGBA(
        203,
        102,
        102,
        1
    ),
    "Schváleno",
    RGBA(
        187,
        221,
        140,
        1
    )
)


#gallery filter

SortByColumns(
    Filter(
        colAllItems,
        Status.Value = "Ke zpracování" And Not(User().Email in Approved.Email),
        IsBlank(input_SearchEvidence) || IsEmpty(input_SearchEvidence) || input_SearchEvidence.Text in Název
    ),
    "Created",
    If(
        SortDescending,
        Ascending,
        Descending
    )
)

Set(varPopUpEvidenceSpinner, true);
If(CountRows(varRecordEvidence.Schvalovatel) - 1 = CountRows(varRecordEvidence.Approved), Patch(Evidence, LookUp(MPSV_Notification_Items, Název = varRecordEvidence.Název), {}))  

Set(
    varPopUpEvidenceSpinner,
    true
);
ClearCollect(
    colPeopleApproved,
    LookUp(
        MPSV_Notification_Items,
        Název = varRecordEvidence.Název
    ).Approved
);
Patch(
    colPeopleApproved,
    Defaults(colPeopleApproved),
    {
        Claims: "i:0#.f|membership|" & User().Email,
        DisplayName: "",
        Department: "",
        Email: User().Email,
        JobTitle: "",
        Picture: ""
    }
);
If(
    CountRows(varRecordEvidence.Schvalovatel) - 1 = CountRows(varRecordEvidence.Approved),
    Patch(
        MPSV_Notification_Items,
        LookUp(
            MPSV_Notification_Items,
            Název = varRecordEvidence.Název
        ),
        {
            Approved: Table(
                {
                    '@odata.type': "#Microsoft.Azure.Connectors.SharePoint.SPListExpandUser",
                    Claims: "i:0#.f|membership|" & User().Email,
                    DisplayName: "",
                    Department: "",
                    Email: User().Email,
                    JobTitle: "",
                    Picture: ""
                }
            )
            #místo tabulky kolekci colPeopleApproved
            ,
            Status: {Value: "Schváleno"}
        }
    ),
    Patch(
        MPSV_Notification_Items,
        LookUp(
            MPSV_Notification_Items,
            Název = varRecordEvidence.Název
        ),
        {
            Approved: Table(                                            
                {
                    '@odata.type': "#Microsoft.Azure.Connectors.SharePoint.SPListExpandUser",
                    Claims: "i:0#.f|membership|" & User().Email,
                    DisplayName: "",
                    Department: "",
                    Email: User().Email,
                    JobTitle: "",
                    Picture: ""
                }
            )
            #místo tabulky kolekci colPeopleApproved
        }
    )
);
Set(
    varPopUpItemApproval,
    false
);
Set(
    varPopUpEvidenceSpinner,
    false
)

ClearCollect(colAttachmentTable, varRecord.Attachments),
Set(
    varPopUpEvidenceSpinner,
    true
);
ClearCollect(
    colRemovedAttachments,
    AttachmentForm_2.Attachments
);
ClearCollect(
    colDeleteAttachmentsName,
    Filter(
        colAttachmentTable,
        !(Id in colRemovedAttachments.Value)
    )
);
ForAll(
    colDeleteAttachmentsName,
    MPSV_Delete_Attachments.Run(
        {
            text: varRecord.ID,
            text_1: Id
        }
    )
);
Refresh(MPSV_Notification_Items);
        
ClearCollect(
    colAttachmentTable,
    LookUp(
        MPSV_Notification_Items,
        'Inventární číslo' = varRecord.field_7
    ).Přílohy
);
Reset(AttachmentForm_1);
Clear(colDeleteAttachmentsName);
Clear(colRemovedAttachments);
Set(
    varPopUpEvidenceSpinner,
    false
)