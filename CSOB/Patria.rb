{
    contentBytes: First(AttachmentsForm.Attachments).Value;
    name: First(AttachmentsForm.Attachments).Name
}

UploadContractToDocumentLibrary.Run(lb_ContractName.Text; dp_Guarantor.Selected.Název; dp_Counterparty.Selected.Result; Text(ConcludedON.SelectedDate); Text('Effective Date'.SelectedDate); Text(Validity.SelectedDate); dp_ContractType.Selected.'Contract type'; dp_RepPerson.Selected.DisplayName; Note.Text; dp_Status.Selected.Value; {
    contentBytes: First(AttachmentsForm.Attachments).Value;
    name: First(AttachmentsForm.Attachments).Name
})

@{triggerBody()?['file']?['name']}
@{triggerBody()?['file']?['contentBytes']}

UploadFileToDocumentLibrary.Run(
    {
        file: {
            contentBytes: First(att_SubmitContract_AttachFile.Attachments).Value,
            name: First(att_SubmitContract_AttachFile.Attachments).Name
                }
    }
);


UploadContractToDocumentLibrary.Run(
    lb_ContractName.Text;
    dp_Guarantor.Selected.Název;
    dp_Counterparty.Selected.Result;
    dp_ContractType.Selected.'Contract type';
    dp_RepPerson.Selected.DisplayName;
    Note.Text;
    Text(ConcludedON.SelectedDate);
    ContractNumber.Text;
    {
        text_6: Text(dp_Status.Selected.Value);
        text_8: Text('Effective Date'.SelectedDate);
        text_9: Text(Validity.SelectedDate);
        file: {
            contentBytes: First(AttachmentsForm.Attachments).Value;
            name: First(AttachmentsForm.Attachments).Name
        }
    }
)


ForAll(
AttachmentsForm.Attachments As Document;
UploadContractToDocumentLibrary.Run(
    lb_ContractName.Text;
    dp_Guarantor.Selected.Název;
    dp_Counterparty.Selected.Result;
    dp_ContractType.Selected.'Contract type';
    dp_RepPerson.Selected.DisplayName;
    Note.Text;
    Text(ConcludedON.SelectedDate);
    ContractNumber.Text;
    {
        text_6: Text(dp_Status.Selected.Value);
        text_8: Text('Effective Date'.SelectedDate);
        text_9: Text(Validity.SelectedDate);
        file: {
            contentBytes: Document.Value;
            name: Document.Name
            }
        }
    )
);;

Reset(dp_Guarantor);; Reset(dp_Counterparty);; Reset(dp_ContractType);; Reset(dp_RepPerson);; Reset(ConcludedON);; Reset('Effective Date');; Reset(Validity);; Reset(dp_Status);; Reset(AttachmentsForm)

Concurrent(
    ClearCollect(
         colCarsChunk1,
         Sort('Car Inventory', ID, Ascending)
     ),
     ClearCollect(
         colCarsChunk2,
         Sort('Car Inventory', ID, Descending)
     )
);
ClearCollect(
    colCars,
    colCarsChunk1,
    Filter(colCarsChunk2, Not(ID in colCarsChunk1.ID))
);
Clear(colCarsChunk1);
Clear(colCarsChunk2);


Set(varSpinner; true);;
//Reset(NameContract);;Reset(dp_Guarantor);; Reset(dp_Counterparty);; Reset(dp_ContractType);; Reset(dp_RepPerson);; Reset(ConcludedON);; Reset('Effective Date');; Reset(Validity);; Reset(dp_Status);;Reset(AttachmentsForm);; Reset(Note)
//;;
Set(varPopUp; false);;
Set(varSpinner; false)


InputTextPlaceholder: If(IsBlank(Self.SelectedDate); Text(Blank()))
'Načíst_soubory_(jen_vlastnosti)'

@{triggerBody()?['file']?['name']}
@{triggerBody()['file']['contentBytes']}
if(empty(triggerBody()?['text_11']),'','')
if(equals(triggerBody()?['text_11'],null),null)
if(equals(triggerBody()?['text_11'],null), , triggerBody()?['text_11'])

If(!IsBlank(varContractID); LookUp(colContractType; 'Contract Type Dropdown View' = LookUp(Smlouvy; DocID = varContractID; ContractType)))

-----------------------------------------------------------------------------------------------------------------------------------

Set(varSpinner; true);;Set(varRandItemID; RandBetween(0;100000));;
ForAll(
    AttachmentsForm.Attachments As Document;
    UploadContractToDocumentLibrary.Run(
        NameContract.Text;
        dp_Guarantor.Selected.Název;
        dp_Counterparty.Selected.Result;
        dp_ContractType.Selected.'Contract type';
        Concat(dp_RepPerson.SelectedItems; DisplayName; "; ");
        ContractNumber.Text;
        concludedOnDate.Text;
        If(!IsBlank(varContractID); varContractID; ItemID);
        {
            text_5: Note.Text;
            text_8: Text(dp_Status.Selected.Value);
            text_9: effectiveDate.Text;
            text_10: validityDate.Text;
             file: {
                contentBytes: Document.Value;
                name: Document.Name
            }
        }
    )
);;
Patch('Contracts - Logs'; {UID: ItemID.Text; 'Contract Name': NameContract.Text; 'Contract ID': ContractNumber.Text; 'Concluded On': ConcludedON.SelectedDate; Guarantor: dp_Guarantor.Selected.Název; CounterParty: dp_Counterparty.Selected.Result; 'Responsible Person': Concat(dp_RepPerson.SelectedItems; DisplayName; "; "); 'Effective Date': effectiveDate.Text; Validity: Validity.SelectedDate; 'Contract Type': dp_ContractType.Selected.'Contract type'; Description: Note.Text; Action: If(!IsBlank(varContractID); "Edit"; "New")});;
Reset(NameContract);;Reset(dp_Guarantor);; Reset(dp_Counterparty);; Reset(dp_ContractType);; Reset(dp_RepPerson);; Reset(ConcludedON);; Reset('Effective Date');; Reset(Validity);; Reset(dp_Status);;Reset(AttachmentsForm);; Reset(Note);; Set(varEndDate; Blank());;
Set(varRandItemID; Blank());;
Set(varPopUp; false);;
Set(varSpinner; false);;
Notify("Contract " & ItemID.Text & " saved."; Success; 4000);;
Navigate(HomeScreen;ScreenTransition.Fade)




If(!IsBlank(varContractID); LookUp(colContractType;  Title = LookUp(colLogs; UID = varContractID; ContractType)))


#prod repairs

ForAll(
    AttachmentsForm.Attachments As Document;
UploadContractToDocumentLibrary_v2.Run(
    {
        text: NameContract.Text;
        text_1: dp_Guarantor.Selected.Název;
        text_2: dp_Counterparty.Selected.Result;
        text_3: dp_ContractType.Selected.'Contract type';
        text_4: Concat(dp_RepPerson.SelectedItems; DisplayName; "; ");
        text_5: ContractNumber.Text;
        text_6: concludedOnDate.Text;
        text_7: If(!IsBlank(varContractID); varContractID; ItemID);
        text_8: Note.Text;
        text_9: Text(dp_Status.Selected.Value);
        text_10: effectiveDate.Text;
        text_11: validityDate.Text;
        file: {
                contentBytes: Document.Value;
                name: Document.Name
                }
        }
    )
)
;;
Patch(
    'Contracts - Logs';
    {
        UID: ItemID.Text;
        'Contract Name': NameContract.Text;
        'Contract ID': ContractNumber.Text;
        'Concluded On': ConcludedON.SelectedDate;
        Guarantor: dp_Guarantor.Selected.Název;
        CounterParty: dp_Counterparty.Selected.Result;
        'Responsible Person': Concat(
            dp_RepPerson.SelectedItems;
            DisplayName;
            "; "
        );
        'Effective Date': effectiveDate.Text;
        Validity: Validity.SelectedDate;
        'Contract Type': dp_ContractType.Selected.'Contract type';
        Description: Note.Text;
        Action: If(
            !IsBlank(varContractID);
            "Edit";
            "New"
        )
    }
)



OnStart:                ClearCollect(colCounterParty2; ShowColumns(colContacts; "ContactDropdownView"; "Title"))
Protistrana_Zkratka:    Concat(dp_Counterparty.SelectedItems.Title; Title; "; ")
dp_Counterparty:        
    OnChange:           ClearCollect(colCounterPartySelected; dp_Counterparty.SelectedItems.Title)


    If(IsBlank(varContractID); Patch('[PROD] Item ID'; LookUp('[PROD] Item ID'; ID = 1); {Increment: ItemIDNumber_Increment + 1}));;
//Set(varLastItemID; First(Sort(Contracts; Created; Descending)).DocID + 1);;
Set(varLastItemID; LookUp('[PROD] Item ID'; ID = 1).Increment);;
Set(
    varSpinner;
    true
);;
Set(
    varRandItemID;
    RandBetween(
        0;
        100000
    )
);;
//ForAll(
//    AttachmentsForm.Attachments As Document;
//    UploadContractToDocumentLibrary.Run(
//        NameContract.Text;
//        dp_Guarantor.Selected.Název;
//        dp_Counterparty.Selected.Result;
//        dp_ContractType.Selected.'Contract type';
//        Concat(
//            dp_RepPerson.SelectedItems;
//            DisplayName;
//            "; "
//        );
//        ContractNumber.Text;
//        concludedOnDate.Text;
//        If(
//            !IsBlank(varContractID);
//            varContractID;
//            ItemID
//        );
//        {
//            text_5: Note.Text;
//            text_8: Text(dp_Status.Selected.Value);
//            text_9: effectiveDate.Text;
//            text_10: validityDate.Text;
//            file: {
//                contentBytes: Document.Value;
//                name: Document.Name
//            }
//        }
//    )
//);;
ForAll(
    AttachmentsForm.Attachments As Document;
    UploadContractToDocumentLibrary_v2.Run(
        {
            text: NameContract.Text;
            text_1: If(!IsBlank(varContractID); EditGuarantor.Text ;dp_Guarantor.Selected.Title);
            text_2: If(!IsBlank(varContractID); Counterparty.Text; Concat(dp_Counterparty.SelectedItems.Result; Result; "; "));
            text_3: If(!IsBlank(varContractID); ContractType.Text; dp_ContractType.Selected.'Contract Type Dropdown View');
            text_4: If(!IsBlank(varContractID); RepPerson.Text ;Concat(
                dp_RepPerson.SelectedItems;
                DisplayName;
                "; "
            ));
            text_5: ContractNumber.Text;
            text_6: concludedOnDate.Text;
            text_7: If(
                !IsBlank(varContractID);
                varContractID;
                varLastItemID //ItemID.Text
            );
            text_8: Note.Text;
            text_9: Text(dp_Status.Selected.Value);
            text_10: If(EffectiveDateFinal.Visible = true; EffectiveDateFinal.Text; EffectiveDatePatch.Text);  //Text(EffectiveDateFinal.Text; "dd.mm.yyyy");//effectiveDate.Text; //Text(effectiveDate; "dd.mm.yyyy");
            text_11: validityDate.Text;
            file: {
                contentBytes: Document.Value;
                name: Document.Name
            }
        }
    )
);;
Patch(
    '[PROD] Contracts - Logs';
    {
        UID: If(
                !IsBlank(varContractID);
                varContractID;
                varLastItemID); //ItemID.Text
        'Contract Name': NameContract.Text;
        'Contract ID': ContractNumber.Text;
        'Concluded On': ConcludedON.SelectedDate;
        Guarantor: If(!IsBlank(varContractID); EditGuarantor.Text ;dp_Guarantor.Selected.Title);
        CounterParty: If(!IsBlank(varContractID); Counterparty.Text;dp_Counterparty.Selected.Result);
        'Responsible Person': If(!IsBlank(varContractID); RepPerson.Text ;Concat(
                dp_RepPerson.SelectedItems;
                DisplayName;
                "; "
            ));
        'Effective Date': If(EffectiveDateFinal.Visible = true; EffectiveDateFinal.Text; Text(effectiveDate; "dd.mm.yyyy"));
        Validity: Validity.SelectedDate;
        'Contract Type': If(!IsBlank(varContractID); ContractType.Text; dp_ContractType.Selected.'Contract Type Dropdown View');
        Description: Note.Text;
        Action: If(
            !IsBlank(varContractID);
            "Edit";
            "New"
        )
    }
);;
//Reset(NameContract);;
//Reset(dp_Guarantor);;
//Reset(dp_Counterparty);;
//Reset(dp_ContractType);;
//Reset(dp_RepPerson);;
//Reset(ConcludedON);;
//Reset('Effective Date');;
//Reset(Validity);;
//Reset(dp_Status);;
//Reset(AttachmentsForm);;
//Reset(Note);;
Set(
    varEndDate;
    Blank()
);;
Set(
    varRandItemID;
    Blank()
);;
Set(
    varPopUp;
    false
);;
Set(
    varSpinner;
    false
);;
Notify(
    "Contract " & If(!IsBlank(varContractID); varContractID; varLastItemID) & " saved."; //varLastItemID Or ItemID.Text
    Success;
    4000
);;
Navigate(
    HomeScreen;
    ScreenTransition.Fade
)
;;
Set(varLastItemID; Blank())
;;
Refresh('[PROD] Item ID');;
Refresh(Contracts);;
Refresh('[PROD] Contacts - List')

//;;If(IsBlank(varContractID); Patch('[PROD] Item ID'; LookUp('[PROD] Item ID'; ID = 1); {Increment: ItemID + 1}))