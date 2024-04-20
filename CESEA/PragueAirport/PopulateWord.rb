#first replace "Jmeno"
replace(outputs('Get_file_content')?['body'], 'Jméno_a_příjmení', triggerBody()['text'])

#replace image
replace(json(triggerBody(),['text_8']), 'data:image/png;base64,', '')


base64ToBinary(outputs('imgBase64'))

#text_8 = image

#create file 1
@{outputs('replaceJmeno')}

#napsat (replaceName)
@{replace(outputs('Get_file_content')?['body'], 'Jméno a příjmení', triggerBody()['text'])}



@{base64ToBinary(outputs('imgBase64_2'))}

@{base64ToBinary(outputs('imgBase64'))}