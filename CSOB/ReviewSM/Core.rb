{
  "$schema": "https://developer.microsoft.com/json-schemas/sp/column-formatting.schema.json",
  "elmType": "div",
  "debugMode": true,
  "txtContent": "@currentField",
  "style": {
     "min-height":"56px",
    "background-color": "pink"
  }
}

{
  "$schema": "https://developer.microsoft.com/json-schemas/sp/column-formatting.schema.json",
  "elmType": "div",
  "debugMode": true,
  "txtContent": "@currentField",
  "style": {
    "background-color": "pink"
  }
}

{
  "$schema": "https://developer.microsoft.com/json-schemas/sp/v2/column-formatting.schema.json",
  "elmType": "div",
  "style": {
    "box-sizing": "border-box",
    "padding": "0 2px",
    "overflow": "hidden",
    "text-overflow": "ellipsis"
  },
  "attributes": {
    "class": "sp-css-backgroundColor-BgLightGray sp-field-fontSizeSmall sp-css-color-LightGrayFont"
  },
  "txtContent": "[$CUID.displayValue]"
}

#alter
@item()?['CUID']

--changeset_@{actions('settings')?['trackedProperties']['changeSetGUID']}
Content-Type: application/http
Content-Transfer-Encoding: binary

POST @{outputs('settings')['siteAddress']}_api/web/lists('@{outputs('settings')['listName']}')/items HTTP/1.1
Content-Type: application/json;odata=verbose

|RowData|

#old
--changeset_@{actions('settings')?['trackedProperties']['changeSetGUID']}
Content-Type: application/http
Content-Transfer-Encoding: binary

POST @{outputs('settings')['siteAddress']}_api/web/lists/getByTitle('@{outputs('settings')['listName']}')/items HTTP/1.1
Content-Type: application/json;odata=verbose

|RowData|

/Review_SM_Dokumenty/Forms
formatDateTime(utcNow(), 'yyyy-MM-dd')
addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), 30)

#S-Cube
@if(equals(items('Použít_u_každého')?['S-Cube'], 'x'), 'true', 'false')

#table dynamic range
=OFFSET(List1!A1,0,0,SUBTOTAL(103,List1!$A:$A),27)

010c_ek_x00e1_medo eq '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}' and V_x00fd_sledek ne 'OK' and V_x00fd_sledek_x0028_prvn_x00ed_ ne 'OK' and Robot eq 'Ano'

formatDateTime(utcNow(), 'yyyy-MM-dd')
addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), 30)
@equals(triggerBody()?['ATOS']?['Value'],'ANO' )

@And(equals(triggerBody()?['V_x00fd_sledek_x0028_prvn_x00ed_']?['Value'],'NOK'), not(equals(triggerOutputs()?['body/Editor/Email'], triggerOutputs()?['body/Author/Email'])))
@And(equals(triggerBody()?['V_x00fd_sledek_x0028_prvn_x00ed_']?['Value'],'NOK'), not(equals(triggerOutputs()?['body/Editor/Email'], triggerOutputs()?['body/Author/Email'])))

@And(equals(triggerBody()?['V_x00fd_sledek_x0028_posledn_x00']?['Value'],'NOK'), not(equals(triggerOutputs()?['body/Editor/Email'], triggerOutputs()?['body/Author/Email'])))

formatDateTime(utcNow(), 'yyyy-MM-dd')
addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), 20)

formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), 30), 'dd.MM.yyyy')

item()?['Datum']
item()?['Odeslat_x0161_ablonu']
item()?['V_x00fd_sledek']

@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), equals(item()?['Robot'], 'Ano'))
@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), utcNow()), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), not(equals(item()?['Robot'], 'Ano')))

@and(not(equals(item()?['Datum'], null)), equals(formatDateTime(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), 'dd.MM.yyyy'), formatDateTime(utcNow(), 'dd.MM.yyyy')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), not(equals(item()?['Robot'], 'Ano')))

@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), equals(item()?['Robot'], 'Ano'))
@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), equals(item()?['Robot'], 'Ano'))
@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')))
@and(not(equals(item()?['Datum_prvni_vyzva'], null)), greaterOrEquals(convertTimeZone(item()?['Datum_prvni_vyzva'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')))
@and(not(equals(item()?['Datum_x0028_posledn_x00ed_v_x00f'], null)), greaterOrEquals(convertTimeZone(item()?['Datum_x0028_posledn_x00ed_v_x00f'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')))

@{body('filterOutputs')}
@{items('filterOutputs')?['Odeslat_x0161_ablonu/Value']}
@{items('filterOutputs')?['P_x0159__x00ed_jemce']}
@{items('filterOutputs')?['Jm_x00e9_no']}
@{items('filterOutputs')?['I_x010c_O']}
@{items('SendEmail')?['Jm_x00e9_no']} (@{items('SendEmail')?['CUID']})
@{items('SendEmail')?['Odeslat_x0161_ablonu']}


@and(not(equals(item()?['CekameDoPrvniVyzva '], null)), greaterOrEquals(convertTimeZone(item()?['CekameDoPrvniVyzva '], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), not(equals(item()?['V_x00fd_sledek_x0028_prvn_x00ed_ ne'], 'OK')), equals(item()?['Robot'], 'Ano'))
@and(not(equals(item()?['CekameDoPrvniVyzva '], null)), greaterOrEquals(convertTimeZone(item()?['CekameDoPrvniVyzva '], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), not(equals(item()?['V_x00fd_sledek_x0028_prvn_x00ed_ ne'], 'OK')), equals(item()?['Robot'], 'Ano'))


(Datum ne null and Datum lt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -30), 'yyyy-MM-dd')}') 
and V_x00fd_sledek eq'OK' or V_x00fd_sledek eq'NOK' or
V_x00fd_sledek_x0028_posledn_x00 eq 'OK' or V_x00fd_sledek_x0028_posledn_x00 eq 'NOK' or
V_x00fd_sledek_x0028_prvn_x00ed_ eq 'OK' or V_x00fd_sledek_x0028_prvn_x00ed_ eq 'NOK' or
V_x00fd_sledek_x0028_urgence_x00 eq 'OK' or V_x00fd_sledek_x0028_urgence_x00 eq 'NOK'


@or(equals(item()?['V_x00fd_sledek/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_urgence_x00/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_posledn_x00/Value'], 'OK'))
@or(equals(item()?['V_x00fd_sledek/Value'], 'NOK'), equals(item()?['V_x00fd_sledek_x0028_urgence_x00/Value'], 'NOK'), equals(item()?['V_x00fd_sledek_x0028_posledn_x00/Value'], 'NOK'))

Datum gt 'formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')' and Datum lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}'
@and(not(equals(item()?['Datum_prvni_vyzva'], null)) ,greaterOrEquals(item()?['Datum_prvni_vyzva'], formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')), lessOrEquals(item()?['Datum_prvni_vyzva'], formatDateTime(utcNow(), 'yyyy-MM-dd')))
@and(not(equals(item()?['Datum_x0028_urgence_x0029_'], null)), greaterOrEquals(item()?['Datum_x0028_urgence_x0029_'], formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')), lessOrEquals(item()?['Datum_x0028_urgence_x0029_'], formatDateTime(utcNow(), 'yyyy-MM-dd')))
@and(not(equals(item()?['Datum_x0028_posledn_x00ed_v_x00f'], null)), greaterOrEquals(item()?['Datum_x0028_posledn_x00ed_v_x00f'], formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')), lessOrEquals(item()?['Datum_x0028_posledn_x00ed_v_x00f'], formatDateTime(utcNow(), 'yyyy-MM-dd')))

@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')))
@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')), lessOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')))



@and(not(equals(item()?['Datum_x0028_posledn_x00ed_v_x00f'], null)), greaterOrEquals(convertTimeZone(item()?['Datum_x0028_posledn_x00ed_v_x00f'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')))

@and(not(equals(item()?['Datum'], null)) ,greaterOrEquals(item()?['Datum'], formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')), lessOrEquals(item()?['Datum_prvni_vyzva'], formatDateTime(utcNow(), 'yyyy-MM-dd')))


#počítadlo
#odkontrolováno query
Datum gt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')}' and Datum lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}'
#first vyzva
Datum_prvni_vyzva gt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')}' and Datum_prvni_vyzva lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}'
#urgence
Datum_x0028_urgence_x0029_  gt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')}' and Datum_x0028_urgence_x0029_  lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}'
#final vyzva
Datum_x0028_posledn_x00ed_v_x00f gt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')}' and Datum_x0028_posledn_x00ed_v_x00f lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}'


(Datum ne null and Datum gt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')}' and Datum lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}') 
and V_x00fd_sledek eq'OK'

union(variables('varZpracovatele'), variables('varZpracovatele'))

union(outputs('Získat_položky')?['body/value']?['Zpracovatel/Email'],outputs('Získat_položky')?['body/value']?['Zpracovatel/Email'])

@or(equals(item()?['V_x00fd_sledek/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_urgence_x00/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_posledn_x00/Value'], 'OK'))

@or(equals(item()?['V_x00fd_sledek/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_urgence_x00/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_posledn_x00/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_prvn_x00ed_/Value'], 'OK')) 
#this is the one
@or(equals(item()?['V_x00fd_sledek/Value'], 'NOK'), equals(item()?['V_x00fd_sledek_x0028_urgence_x00/Value'], 'NOK'), equals(item()?['V_x00fd_sledek_x0028_posledn_x00/Value'], 'NOK'), equals(item()?['V_x00fd_sledek_x0028_prvn_x00ed_/Value'], 'NOK')) 
#this it the one

@or(equals(item()?['V_x00fd_sledek/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_urgence_x00/Value'], 'OK'), equals(item()?['V_x00fd_sledek_x0028_posledn_x00/Value'], 'OK'))

(Datum ne null and Datum gt '@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')}' and Datum lt '@{formatDateTime(utcNow(), 'yyyy-MM-dd')}') #old
formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), -7), 'yyyy-MM-dd')


Datum ge formatDateTime(startOfMonth(getPastTime(1,'Month')),'yyyy-MM-dd') and Datum lt formatDateTime(startOfMonth(utcNow()),'yyyy-MM-dd')) #last functional

(Datum ne null and Datum gt '2023-03-01' and Datum lt '2023-04-01')
(Datum ne null and Datum gt '2023-04-05' and Datum lt '2023-04-12')

(Datum ne null and Datum ge '@{formatDateTime(startOfMonth(getPastTime(1,'Month')),'yyyy-MM-dd')}' and Datum lt '@{formatDateTime(startOfMonth(utcNow()),'yyyy-MM-dd')}')



