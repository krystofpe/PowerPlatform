formatDateTime(items('Použít_u_každého')?['Datum uzavření'], 'dd.MM.yyyy')
formatDateTime(items('Použít_u_každého')?['Datum odpovědi'], 'dd.MM.yyyy')


formatDateTime(addDays('30.12.1899', int(items('Použít_u_každého')?['Datum uzavření'])), 'dd.MM.yyyy')
formatDateTime(addDays('30.12.1899', int(items('Použít_u_každého')?['Datum odpovědi'])), 'dd.MM.yyyy')


formatDateTime(items('Použít_u_každého')?['Datum uzavření'], 'MM.dd.yyyy')
formatDateTime(items('Použít_u_každého')?['Datum odpovědi'], 'MM.dd.yyyy')


formatDateTime(items('Použít_u_každého')?['Datum uzavření'], 'yyyy-MM-dd')
formatDateTime(items('Použít_u_každého')?['Datum odpovědi'], 'yyyy-MM-dd')


concat(split(items('Použít_u_každého')?['Datum odpovědi'], '.')[2], '-',
split(items('Použít_u_každého')?['Datum odpovědi'], '.')[1], '-', 
split(items('Použít_u_každého')?['Datum odpovědi'], '.')[0])

concat(split(items('Použít_u_každého')?['Datum uzavření'], '.')[2], '-',
split(items('Použít_u_každého')?['Datum uzavření'], '.')[1], '-', 
split(items('Použít_u_každého')?['Datum uzavření'], '.')[0])


#formatDateTime(items('Použít_u_každého')?['datum_uzavreni'], 'dd.MM.yyyy')
concat(split(items('Použít_u_každého')?['datum_uzavreni'], '.')[2], '-',
split(items('Použít_u_každého')?['datum_uzavreni'], '.')[1], '-', 
split(items('Použít_u_každého')?['datum_uzavreni'], '.')[0])
#formatDateTime(items('Použít_u_každého')?['datum_dotazovani'], 'dd.MM.yyyy')
concat(split(items('Použít_u_každého')?['datum_dotazovani'], '.')[2], '-',
split(items('Použít_u_každého')?['datum_dotazovani'], '.')[1], '-', 
split(items('Použít_u_každého')?['datum_dotazovani'], '.')[0])


'@{formatDateTime(items('Použít_u_každého')?['datum_uzavreni'], 'dd.MM.yyyy')}'

//
=IF(WEEKDAY([Modified])=5;[Modified]+4;IF(WEEKDAY([Modified])=6;[Modified]+4;IF(WEEKDAY([Modified])=7;[Modified]+3;IF(WEEKDAY([Modified])=1;[Modified]+2;[Modified]+2))))
=If(weekday(Today + 10;2)=6;Today + 10 + 2; If(weekday(Today + 10;2)=7;Today + 10 +1;Today + 10)

-----------------------------------------------------------------------------------------------------------------------------------

field_9 eq '@{items('Použít_u_každého')?['trigger']}' and field_20 eq '@{items('Použít_u_každého')?['CUID']}' and field_2 eq '@{items('Použít_u_každého')?['datum_uzavreni']}'

field_9 eq '@{items('Použít_u_každého')?['trigger']}' and field_20 eq '@{items('Použít_u_každého')?['CUID']}' and field_8 eq '@{items('Použít_u_každého')?['komentar']}'

field_9 eq '@{items('Použít_u_každého_2')?['trigger']}' and field_20 eq '@{items('Použít_u_každého_2')?['CUID']}' and field_8 eq '@{items('Použít_u_každého_2')?['komentar']}'

field_2 eq datum_uzavreni
field_8 eq komentar


2022-03-04T00:00:00.000Z


field_9 eq '@{items('Použít_u_každého')?['trigger']}' and field_20 eq '@{items('Použít_u_každého')?['CUID']}' and field_3 eq '@{formatDateTime(addDays('30.12.1899', int(items('Použít_u_každého')?['Datum uzavření'])), 'dd.MM.yyyy')}'

field_9 eq '@{items('Použít_u_každého')?['trigger']}' and field_20 eq '@{items('Použít_u_každého')?['CUID']}'

'@{formatDateTime(items('Použít_u_každého')?['datum_uzavreni'], 'dd.MM.yyyy')}'


field_9 eq '@{items('Použít_u_každého')?['trigger']}' and field_20 eq '@{items('Použít_u_každého')?['CUID']}' and field_2 eq '@{formatDateTime(items('Použít_u_každého')?['datum_uzavreni'], 'dd.MM.yyyy')}'

field_9 eq '@{items('Použít_u_každého_2')?['trigger']}' and field_20 eq '@{items('Použít_u_každého_2')?['CUID']}' and field_2 eq '@{formatDateTime(items('Použít_u_každého_2')?['datum_uzavreni'], 'yyyy.MM.dd')}'


length(body('Získat_položky_2')?['value'])

formatDateTime(utcNow(); 'MMMM')


If(ThisItem.Zpracováno = "ANO"; RGBA(63; 195; 129; 1); RGBA(254; 121; 104; 1))
#RGBA(0; 51; 102; 1)

formatDateTime(utcNow(), 'yyyy.MM.dd')
formatDateTime(utcNow(), 'dd.MM.yyyy')

Text(DateTimeValue(Label2.Text); "dd.mm.yy")

convertTimeZone(utcnow(),'UTC','W. Europe Standard Time','dd/MM/yyyy HH:mm')

and Modified gt '@{variables('Modified')}'


{
  "$schema": "https://developer.microsoft.com/json-schemas/sp/v2/column-formatting.schema.json",
  "elmType": "div",
  "txtContent": "=getMonth(@currentField)+'.'+(getDate(@currentField))+'.'+getYear(@currentField)"
}


#add X business days
DateAdd(DateValue(DatePicker1.SelectedDate);Value(3) + RoundDown((Weekday(DateValue(DatePicker1.SelectedDate);Monday) + Value(3) - 1) / 5;0) * 2;Days)

concat(if(equals(length(split(items('Použít_u_každého')?['Datum'], '.')[2]), 2), concat(string(20), split(items('Použít_u_každého')?['Datum'], '.')[2]), split(items('Použít_u_každého')?['Datum'], '.')[2]),'-',
split(items('Použít_u_každého')?['Datum'], '.')[1], '-', 
split(items('Použít_u_každého')?['Datum'], '.')[0])