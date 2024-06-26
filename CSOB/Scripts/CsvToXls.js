/**
 * Convert incoming CSV data into a range and add it to the workbook.
 */
function main(workbook: ExcelScript.Workbook, csv: string, sheetName: string) {
    let sheet = workbook.getWorksheet("List1");
    // Set calculation mode to manual
    workbook.getApplication().setCalculationMode(ExcelScript.CalculationMode.manual);
  
    // Remove any Windows \r characters.
    csv = csv.replace(/\r/g, "");
  
    // Split each line into a row.
    let rows = csv.split("\n");
  
    /*
     * For each row, match the comma-separated sections.
     * For more information on how to use regular expressions to parse CSV files,
     * see this Stack Overflow post: https://stackoverflow.com/a/48806378/9227753
     */
    const csvMatchRegex = /(?:,|\n|^)("(?:(?:"")*[^"]*)*"|[^",\n]*|(?:\n|$))/g
    let rowCount = 0; 
    rows.forEach((value, index) => {
      if (value.length > 0) {
        let row = value.match(csvMatchRegex);
  
        // Check for blanks at the start of the row.
        if (row[0].charAt(0) === ',') {
          row.unshift("");
        }
  
        // Remove the preceding comma.
        row.forEach((cell, index) => {
          row[index] = cell.indexOf(",") === 0 ? cell.substr(1) : cell;
        });
  
        // Create a 2D array with one row.
        let data: string[][] = [];
        data.push(row);
  
  
  
        // Put the data in the worksheet.
        let range = sheet.getRangeByIndexes(index, 0, 1, data[0].length);
        range.setValues(data);
        rowCount++;
          if (rowCount % 5000 === 0) {
             console.log("Syncing 5000 rows.");
    }
      }
    });
  
    // Get the first worksheet 
    const selectedSheet = workbook.getFirstWorksheet();
    const usedRange = selectedSheet.getUsedRange();
    // Create a table using the data range.
    let newTable = workbook.addTable(selectedSheet.getUsedRange(), true);
    newTable.setName("Table1");
    newTable.getRange().getFormat().autofitColumns();
    // Rename worksheet.
    sheet.setName(sheetName);
    // Set calculation mode back to automatic
    workbook.getApplication().setCalculationMode(ExcelScript.CalculationMode.automatic);
  }
  