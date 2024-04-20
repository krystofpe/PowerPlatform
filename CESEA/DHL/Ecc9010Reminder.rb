(ApprovalStatus eq 'Await Aviation approval' or ApprovalStatus eq 'Await CEO approval') and NextReminderDate eq '@{formatDateTime(utcNow(),'yyyy-MM-dd')}'

@{concat('/_api/web/lists(''',parameters('RegionsRCOListGUID'),''')/Items?$filter=Region eq ''',items('For_each')?['Region']?['Value'],'''',
'&$select=*,RCO/Title,RCO/EMail,RegionalCEO/Title,RegionalCEO/EMail,Aviation/Title,Aviation/EMail&$expand=RCO,RegionalCEO,Aviation')}

#with variables

@{concat('/_api/web/lists(''',variables('RegionsRCOListGUID'),''')/Items?$filter=Region eq ''',items('For_each')?['Region']?['Value'],'''','&$select=*,RCO/Title,RCO/EMail,RegionalCEO/Title,RegionalCEO/EMail,Aviation/Title,Aviation/EMail&$expand=RCO,RegionalCEO,Aviation')}


@{concat(variables('ShPSiteURL'),variables('EditFormURL'),items('For_each')?['ID'])}

@{concat('_api/web/lists(''',variables('MembershipListGUID'),''')/Items(',items('For_each')?['ID'],')')}