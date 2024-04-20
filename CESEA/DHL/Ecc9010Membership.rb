EndDate lt '@{formatDateTime(utcNow(),'yyyy-MM-dd')}' and MembershipStatus eq 'Active'

@body('Get_expired_items')?['value']

@{concat('_api/web/lists(''',parameters('MembershipListGUID'),''')/Items(',items('For_each')?['ID'],')')}
@{variables('MembershipListGUID')}
@{concat('_api/web/lists(''',variables('MembershipListGUID'),''')/Items(',items('For_each')?['ID'],')')}


#_api/web/lists('bac61f95-dd1c-4d85-bf79-5e4c1f14efe3')/Items(1111)

#email notification

{  
	"properties": {  
		"__metadata": {  
			"type": "SP.Utilities.EmailProperties"  
		},  
		"To": {  
			"results": ["@{body('Get_Entity_Item')?['CCC']?['Email']}"]  
		},
"BCC": {  
			"results": ["louis.yeung@dhl.com"]
		},
		"Body": "<p>Dear Country Compliance Coordinator<\/p><p>Please be aware that your Membership has expired: <strong>@{triggerBody()?['OrganizationName']}<\/strong><br \/><a href='@{concat(parameters('ShPSiteURL'), parameters('DisplayFormURL'), triggerBody()?['ID'])}'>@{concat(parameters('ShPSiteURL'), parameters('DisplayFormURL'), triggerBody()?['ID'])}<\/a><\/p><p>In case this membership should be re-activated please edit the Membership item. The Membership request will then run through the official approval process again.<\/p><p>If there are any questions, do not hesitate to contact your Regional Compliance Officer.<\/p>",  
		"Subject": "Expired membership on SharePoint of Competition Compliance – Controls on Memberships and Controls on Engaging with Competitors"  
	}
}


@{concat(variables('ShPSiteURL'), variables('DisplayFormURL'), triggerBody()?['ID'])}