@{concat('/_api/web/lists(''',parameters('RegionsRCOListGUID'),''')/Items?$filter=Region eq ''',triggerBody()?['Region']?['Value'],'''','&$select=*,RCO/Title,RCO/EMail,RCO/ID,RegionalCEO/Title,
RegionalCEO/EMail,RegionalCEO/ID,Aviation/Title,Aviation/EMail,Aviation/ID&$expand=RCO,RegionalCEO,Aviation')}

#api/web/lists/getbytitle('')/items

@equals(true,triggerBody()?['Updated'])

@equals(triggerBody()?['Updated'],true)

@{concat('/_api/web/lists(''',parameters('MembershipListGUID'),''')/Items(',triggerBody()?['ID'],')/breakroleinheritance(copyRoleAssignments=false, clearSubscopes=true)')}
@{concat('/_api/web/lists(''',variables('MembershipListGUID'),''')/Items(',triggerBody()?['ID'],')/breakroleinheritance(copyRoleAssignments=false, clearSubscopes=true)')}

@triggerBody()?['Region']?['Value']

@{concat(variables('ShPSiteURL'),'/_api/web/lists(''',variables('MembershipListGUID'),''')/Items(',triggerBody()?['ID'],')/roleassignments/addroleassignment(principalid=',variables('Region_AM_RCO'),',roleDefId=',variables('FullControlRolePermission'),')', ' HTTP/1.1')}