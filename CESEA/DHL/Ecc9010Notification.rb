@and(equals('Membership',triggerBody()?['EngagementType']?['Value']),equals(true,triggerBody()?['ExpiredNotification']))

@and(equals(triggerBody()?['EngagementType']?['Value'],'Membership'),equals(triggerBody()?['ExpiredNotification'],true))


