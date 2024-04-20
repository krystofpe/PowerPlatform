function main(workbook: ExcelScript.Workbook,
    startCell: string): TableData[] {
        // Get the first table in the "PlainTable" worksheet.
        // If you know the table name, use `workbook.getTable('TableName')` instead.
        let ws = workbook.getActiveWorksheet();
        let data = ws.getRange(startCell).getSurroundingRegion();
      let tables = ws.getTables();
      // Create a table with the used cells.
         if (tables.length > 0) {
        console.log('Table is present: ' + tables[0].getName())
        // Optionally you can delete data -- 
        // tables[0].delete();
      } else {
        console.log('No table is present');
        let newTable = ws.addTable(data, true);
        newTable.setName("Table1");
    
      }
    
      const table = workbook.getActiveWorksheet().getTables()[0];
        // Get all the values from the table as text.
        const texts = table.getRange().getTexts();
    
        // Create an array of JSON objects that match the row structure.
        let returnObjects: TableData[] = [];
      if (table.getRowCount() > 0) {
            returnObjects = returnObjectFromValues(texts);
        }
    
        // Log the information and return it for a Power Automate flow.
        console.log(JSON.stringify(returnObjects));
        return returnObjects
    }
    
    // This function converts a 2D array of values into a generic JSON object.
    // In this case, we have defined the TableData object, but any similar interface would work.
    function returnObjectFromValues(values: string[][]): TableData[] {
        let objectArray: TableData[] = [];
        let objectKeys: string[] = [];
        for (let i = 0; i < values.length; i++) {
            if (i === 0) {
                objectKeys = values[i]
                continue;
            }
    
            let object: { [key: string]: string } = {}
            for (let j = 0; j < values[i].length; j++) {
                object[objectKeys[j]] = values[i][j]
            }
    
            objectArray.push(object as unknown as TableData);
        }
    
        return objectArray;
    }
    
    interface TableData {
        "Client Reference": string
        "Transaction Reference": string
        "Execution date": string
        "Debit Value Date": string
        "Transaction Amount": string
        "Transaction Currency": string
        "Cost Direction": string
        "Credit Account Number": string
        "Sloupec1": string 
        "Sending Institution": string
        "Ordering Institution": string
        "Sepa": string
    }