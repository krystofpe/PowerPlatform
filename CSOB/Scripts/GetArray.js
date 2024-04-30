{
  
  const worksheet = workbook.getActiveWorksheet();
  worksheet.setName(sheetName);
  worksheet.getRange("A1:G1").setValues([["Personální oblast", "Global Central Personal Number", "Osobní číslo", "Jméno a příjmení", "E-mailová adresa", "Domain", headers]]);
 
  // Add a new table at range A1:G1 on selectedSheet
  // Optional if you want to use ADD Row Into Table
  let newTable = workbook.addTable(worksheet.getRange("A1:G1"), true);
  newTable.setName(tableName);
  if (worksheet) {
    // Switch to the "Data" worksheet.
    worksheet.activate();
    const table = worksheet.getTable(tableName);
    const tblRange = table.getRangeBetweenHeaderAndTotal();
    let firstEmptyRow = -1;
    const rowsToAdd = jsonData.map(at => convertDataToRow(at));
 
    console.log(rowsToAdd.length);
 
    table.addRows(firstEmptyRow, rowsToAdd);
  }
 
  newTable.getRange().getFormat().autofitColumns();
  newTable.getRange().getFormat().setHorizontalAlignment(ExcelScript.HorizontalAlignment.center);
  newTable.getRange().getFormat().setVerticalAlignment(ExcelScript.VerticalAlignment.center);
 
}
 
/*----------------------- Helper Function ---------------------------*/
function convertDataToRow(at: arrayofdata): (string | number)[] {
  const array: (string | number)[] = [];
  array.push(at.Personalni_oblast);
  array.push(at.Global_Central_Personal_Number);
  array.push(at.Osobni_cislo);
  array.push(at.Jmeno_a_prijmeni);
  array.push(at.Emailova_adresa);
  array.push(at.Domain);
  array.push(at.Compliance);
  return array;
}
 
/*----------------------- Object Interface ---------------------------*/
interface arrayofdata {
  Personalni_oblast: string,
  Global_Central_Personal_Number: string,
  Osobni_cislo: string,
  Jmeno_a_prijmeni: string,
  Emailova_adresa: string,
  Domain: string,
  Compliance: string
}
