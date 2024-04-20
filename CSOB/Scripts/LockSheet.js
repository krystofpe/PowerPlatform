function main(workbook: ExcelScript.Workbook, password: string) {
    workbook.getProtection().protect(password);
  
    workbook.getWorksheets().forEach(sheet => {
      sheet.getProtection().protect({
        allowAutoFilter: true,
        allowSort: true,
        allowFormatCells: true,
        selectionMode: ExcelScript.ProtectionSelectionMode.normal
      }, password);
    });
  }