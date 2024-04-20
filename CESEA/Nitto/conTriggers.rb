@and(or(equals(triggerBody()?['AC_NSCR_WFStatus']?['Value'], 'Back Office approval in-progress'), 
equals(triggerBody()?['AC_NSCR_WFStatus']?['Value'], 'Rejected by production, under evaluation by back-office')), 
equals(triggerBody()?['StartWF'], 'true'))

@and(equals(triggerBody()?['AC_NSCR_WFStatus']?['Value'], 'Production approval in-progress'), equals(triggerBody()?['StartWF'], 'true'))

@and(equals(triggerBody()?['AC_NSCR_WFStatus']?['Value'], 'Masterdata approval in-progress'), equals(triggerBody()?['StartWF'], 'true'))