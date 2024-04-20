#create column (body)
{
    '__metadata': {'type':'SP.Field','addToDefaultView': 'true' },
    'FieldTypeKind': 4,
    'Title': 'List_HK'
}
#create list (body)
{
   "__metadata":{"type": "SP.List"},
   "AllowContentTypes": true,
   "BaseTemplate": 100,
   "Description": "Stores data for HK.",
   "Title": "List_HK"
}

#create choice column
{ '__metadata':
{ 'type': 'SP.FieldChoice', 'addToDefaultView': 'true' },
'Title': 'Parkovací dům - parkoviště',
'FieldTypeKind': 6,
'Required': 'true',
'Choices': { 'results': ['P50 - P1, P2 500', 'P55 - P1, P2 2000'] }
}

#number column
{
'__metadata': {'type':'SP.FieldNumber'},
'FieldTypeKind': 1,
'Title': 'Name of Number Field'
}

#date column
{
'__metadata': {'type':'SP.FieldDateTime', 'addToDefaultView': 'true' },
'FieldTypeKind': 4,
'Title': 'Name of DateTime Field',
'DisplayFormat': 0
}

#person column
{
'__metadata': {'type':'SP.Field', 'addToDefaultView': 'true' },
'FieldTypeKind': 20,
'Title': 'Name of Person or Group Field'
}

#multiline text column
{
'__metadata': {'type':'SP.Field', 'addToDefaultView': 'true' },
'FieldTypeKind': 3,
'Title': 'Name of Multi Line of Text Field'
}