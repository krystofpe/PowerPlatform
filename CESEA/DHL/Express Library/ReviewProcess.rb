#conditional trigger
@equals(triggerBody()?['ELStatus']?['Value'],'Reviewed')

@equals(triggerBody()?['ELStatus']?['Value'],'Start approval process')
@equals(triggerBody()?['_Status']?['Value'],'Obsolete')
#stop infinite runs
@and(equals(triggerBody()?['ELStatus']?['Value'],'Start review process'), not(equals(triggerBody()?['body/Editor/Email'], 'krystof.penka@dev-cesea.cz')))



@and(equals(triggerBody()?['WFELStart'],true), not(equals(triggerBody()?['body/Editor/Email'], 'krystof.penka@dev-cesea.cz')))

@equals(triggerBody()?['WFELStart'],true)

@and(equals(triggerBody()?['WFELStart'],true), not(equals(triggerBody()?['body/Editor/Email'], 'krystof.penka@dev-cesea.cz')), not(equals(triggerBody()?['WFELStart'],true)))