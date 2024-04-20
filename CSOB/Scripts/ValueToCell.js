function main(workbook: ExcelScript.Workbook, targetCell1: string, cellValue1: string, targetCell2: string, cellValue2: string, targetCell3: string, cellValue3: string) {
    let selectedSheet = workbook.getActiveWorksheet();
    selectedSheet.getRange(targetCell1).setValue(cellValue1);
    selectedSheet.getRange(targetCell2).setValue(cellValue2);
    selectedSheet.getRange(targetCell3).setValue(cellValue3);
  }