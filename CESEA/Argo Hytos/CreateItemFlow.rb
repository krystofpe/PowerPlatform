#test
substring(triggerbody()?['Subject'],add(indexOf(triggerbody()?['Subject'],'('),1),
sub(lastIndexOf(triggerbody()?['Subject'],')'),add(indexOf(triggerbody()?['Subject'],')'),1)))

#sample string
Rozvadec, 449705, RPE4-102Z51/01200E13AT0-AXY/M, Rozvadec, 2.1 (Design)
#getting a correct substring
trim(split(outputs('SampleString'), ',')[2])


@{concat('_api/web/lists(''',parameters('MembershipListGUID'),''')/Items(',triggerBody()?['ID'],')')}
@{concat('_api/web/lists(''',variables('MembershipListGUID'),''')/Items(',triggerBody()?['ID'],')')}
@{concat('/_api/web/lists(''',parameters('RegionsRCOListGUID'),''')/Items?$filter=Region eq ''',triggerBody()?['Region']?['Value'],'''','&$select=*,RCO/Title,RCO/EMail,RCO/ID,RegionalCEO/Title,RegionalCEO/EMail,RegionalCEO/ID,Aviation/Title,Aviation/EMail,Aviation/ID&$expand=RCO,RegionalCEO,Aviation')}



@{concat('/_api/web/lists(''',variables('RegionsRCOListGUID'),''')/Items?$filter=Region eq ''',
triggerBody()?['Region']?['Value'],'''','&$select=*,RCO/Title,RCO/EMail,RCO/ID,RegionalCEO/Title,
RegionalCEO/EMail,RegionalCEO/ID,Aviation/Title,Aviation/EMail,Aviation/ID&$expand=RCO,RegionalCEO,Aviation')}


@{concat('/_api/web/lists(''',parameters('RegionsRCOListGUID'),''')/Items?$filter=Region eq ''',
triggerBody()?['Region']?['Value'],'''','&$select=*,RCO/Title,RCO/EMail,RCO/ID,RegionalCEO/Title,
RegionalCEO/EMail,RegionalCEO/ID,Aviation/Title,Aviation/EMail,Aviation/ID&$expand=RCO,RegionalCEO,Aviation')}

split(outputs('HtmlText_Attachment')?['body'], outputs('newLineAttachment'))
split(outputs('HtmlText_Attachment')?['body'], decodeUriComponent('%0D%0A'))

#getproductgroup query

Title eq '@{outputs('ProductGroupCode')}'

@{items('ProductGroup')?['ProductGroup/Value']}
@{body('Filter_array')}

@startsWith(item()?['Title'], variables('CaseNameTEST')) #old - functional
@And(startsWith(item()?['Title'], variables('CaseNameTEST')), contains(item()?['Subject'], variables('ProductKlic')))

@and(startsWith(item()?['Title'], outputs('CaseNameTEST')), contains(item()?['Subject'], outputs('ProductKlic')))
@and(startsWith(item()?['Title'], outputs('CaseName')), contains(item()?['Subject'], outputs('ProductKlic')))

@and(contains(outputs('CaseNameTEST'), item()?['Title']), contains(item()?['Subject'], outputs('ProductKlic')))

@and(startsWith(outputs('CaseName'), item()?['Title']), contains(item()?['Subject'], outputs('ProductKlic'))) 

@and(startsWith(outputs('CaseName'), item()?['Title']), contains(item()?['Subject'], outputs('ProductKlic'))) #last version

contains(item()?['Subject'], outputs('ProductKlic'))

split(toLower(trim(split(triggerOutputs()?['body/subject'], ',')[3])), ' ')[0]

@{items('ProductGroup')?['ProductGroup/Value']}


@{items('ProductGroupOld')?['ProductGroup/Value']}

length(body('ValueNumber'))



@and(startsWith(outputs('CaseName'), item()?['Title']), contains(outputs('ProductKlic'), item()?['ProductKlic']))

@and(startsWith(outputs('CaseName'), item()?['Title']), contains(item()?['Subject'], outputs('ProductKlic'))) #old

@{items('Subject')?['Subject']}

