If(
   IsMatch(input_BitLocker.Text; "\d{2}\-\d{3}\-\d{3}\-\d{4}\-\d{5}") || IsMatch(input_BitLocker.Text; "\d{5}\-\d{3}\-\d{4}\-\d{2}\-\d{5}");
   true ;
   Notify("The string format you typed is not valid, the correct format shoule be 12-123-123-1234-12345 or 12345-123-1234-12-12345";NotificationType.Error);Reset(input_BitLocker)
)

587884-079431-107206-023210-591965-300245-246532-625724
XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX

@{replace(replace(variables('Textace'), 'My Image', variables('Image tag')), '{TADY}', string(rand(100000, 1000000)))}
@{replace(replace(variables('Textace_Owner'), 'My Image', variables('Image tag')), '{TADY}', triggerBody()['text_4'])}
@{replace(replace(replace(variables('Textace_Manager'), 'My Image', variables('Image tag')), '{TADY}', triggerBody()['text_4']), '{USER}', triggerBody()['text'])}

@{triggerBody()?['file']?['name']}




BitLockerRecoveryKey.Run(
    cb_SearchUser.Selected.DisplayName;
    cb_SearchUser.Selected.Mail;
    input_manager.Text;
    input_BitLocker.Text;
    {text_3: label_varManager.Text}
);;
Reset(cb_SearchUser);;
Reset(input_BitLocker);;
Reset(manager_check);;
Set(
    varManager;
    Blank()
);;
Notify(
    "BitLocker Recovery Key odeslán.";
    Success
)