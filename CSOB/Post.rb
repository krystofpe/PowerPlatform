@{base64ToString(outputs('Získat_obsah_souboru')?['body']['$content'])}

json(split(replace(base64ToString(outputs('Získat_obsah_souboru')?['body/contentBytes']),',',';'), outputs('Newline')))
@json(split(replace(base64ToString(outputs('Získat_obsah_souboru')?['body/contentBytes']),',',';'), outputs('CrLf')))

split(outputs('Získat_obsah_souboru')?['body'], decodeUriComponent('%0A'))
split(outputs('Získat_obsah_souboru')?['body'], decodeUriComponent('%0D%0A'))


base64ToBinary(items('Použít_u_každého')?['contentBytes'])
@{items('Použít_u_každého')?['name']}

base64ToString(outputs('Získat_obsah_souboru')?['body']['$content'])
    split(base64ToBinary(outputs('Získat_obsah_souboru')?['body']['$content']), '\r\n')
        split(outputs('Získat_obsah_souboru')?['body']['$content'], '\r\n')
            split(outputs('Získat_obsah_souboru')?['body'], '\r\n')

#get ID of first item in library
@{body('Načíst_soubory_(jen_vlastnosti)')?['value'][0]['{Identifier}']}

split(outputs('contentCSVOneDrive'), outputs('newLineOneDrive'))

@{body('GetItemsDepartmentTemp')?['body/value']}

@{body('Filtrovat_pole')?['value']}

items('CompareLoopSourceList')?['Title']
    items('CompareLoopTargetList')?['Title']
        items('CompareLoopTargetList')?['field_0']
            items('CompareLoopTargetList')?['field_2']

items('CompareLoopTargetList')?['IresIsEnabled']
@items('CompareLoopTargetList')?['ID']

@{items('CompareLoopTargetList')?['Title']}

@items('CompareLoopTargetList')?['IresIsEnabled']


@{items('CompareLoopTargetListNotEquals')?['Title']}

skip(split(outputs('Získat_obsah_souboru_OneDrive')?['body'], decodeUriComponent('%0D%0A')), 1)

@{items('IresEnabledYes')?['Title']}
    @{items('IresEnabledYes')?['field_0']}
        @{items('IresEnabledYes')?['field_2']}
            @{items('IresEnabledYes')?['field_3']}


@{items('UpdateItem')?['Title']}
@{items('IresEnabledYes')?['IresActive']}

@{items('UpdateItem')?['Title']}