function main(workbook: ExcelScript.Workbook, password: string) {
    workbook.getProtection().unprotect(password);

    workbook.getWorksheets().forEach(sheet => {
        sheet.getProtection().unprotect(password);
    });
}