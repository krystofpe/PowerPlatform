length(body('GetOdkontrolovano')?['value'])

add(int(length(body('GetOdkontrolovano')?['value'])), int(length(body('GetOdkontrolovanoCORP')?['value'])))

add(int(length(body('GetFirstVyzva')?['value'])), int(length(body('GetFirstVyzvaCORP')?['value'])))

add(int(length(body('GetUrgence')?['value'])), int(length(body('GetUrgenceCORP')?['value'])))

add(int(length(body('GetFinalVyzva')?['value'])), int(length(body('GetFinalVyzvaCORP')?['value'])))



length(body('GetEvidenceItems')?['value'])
items('SendEmail')?['Datum_prvni_vyzva']
@{items('SendEmail')?['CUID']}

@and(not(equals(item()?['Datum'], null)), greaterOrEquals(convertTimeZone(item()?['Datum'], 'GMT Standard Time', 'Central Europe Standard Time'), formatDateTime(utcNow(), 'yyyy-MM-dd')), not(equals(item()?['Odeslat_x0161_ablonu'], null)), not(equals(item()?['V_x00fd_sledek'], 'OK')), equals(item()?['Robot'], 'Ano'))

#zpracovatel mail
@{replace(items('SendEmail')?['Zpracovatel/Name'], 'i:0#.f|membership|','')}

@{items('SendEmail')?['Datum_prvni_vyzva']}

"folderPath": "Id::AAMkAGY4YmE2NjgyLTNkMDktNGRiNy1iNTg4LTA0Y2EyMmRhN2MzZgAuAAAAAACPOcCf_lrcTo5hQ8iT4oIbAQAXhwVbSxz5SqKref1EXsQkAAAAAAEJAAA=",


https://graph.microsoft.com/v1.0/users/zpracovaniplateb@csob.cz/mailFolders('AAMkAGVlODljZGQ1LTQ5OGEtNGNkYS05ODJhLTRkMDVlMDhlNzY4ZQAuAAAAAAD6eyP79Y8nTb1IwNeghOknAQAoxFOP-230RIB226pfoumxAAULzdUAAAA=')/messages?$orderBy=receivedDateTime&top=100
https://graph.microsoft.com/v1.0/users/jf24003@csob.cz/mailFolders('AAMkAGY4YmE2NjgyLTNkMDktNGRiNy1iNTg4LTA0Y2EyMmRhN2MzZgAuAAAAAACPOcCf_lrcTo5hQ8iT4oIbAQAXhwVbSxz5SqKref1EXsQkAAAAAAEJAAA=')/messages?$orderBy=receivedDateTime&top=1
https://graph.microsoft.com/v1.0/me/mailFolders('AAMkAGY4YmE2NjgyLTNkMDktNGRiNy1iNTg4LTA0Y2EyMmRhN2MzZgAuAAAAAACPOcCf_lrcTo5hQ8iT4oIbAQAXhwVbSxz5SqKref1EXsQkAAAAAAEJAAA=')/messages?$orderBy=receivedDateTime&top=1

@{body('Pošle_požadavek_HTTP_3')?['value']}
@{items('SaveMsg3')?['id']}

@And(equals(triggerBody()?['V_x00fd_sledek_x0028_urgence_x00']?['Value'],'NOK'), not(equals(triggerOutputs()?['body/Editor/Email'], triggerOutputs()?['body/Author/Email'])))

@{formatDateTime(addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), 10), 'dd.MM.yyyy')}

@{addDays(formatDateTime(utcNow(), 'yyyy-MM-dd'), 10)}