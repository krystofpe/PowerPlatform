function main(workbook: ExcelScript.Workbook,
    arrayfromflow: arrayofdata[],
    sheetname: string,
    myTableName: string
) {
    let selectedSheet = workbook.getActiveWorksheet();
    workbook.getApplication().setCalculationMode(ExcelScript.CalculationMode.manual);

    // Set range A1:K1 on selectedSheet
    selectedSheet.getRange("A1:W1").setValues([["ID", "Cele_jmeno", "Datum_dotazovani", "Mesic_odpovedi", "Trigger", "CSI", "CSI_komentar", "Provedene_zmeny", 
    "CC_schuzky", "Domovske_CC", "HUB", "Oblast", "Reklamace_manager", "Poznamka", "Zmena", "Odeslano", "Odeslano_stav","Pobocka", "NPS", "NPS_komentar", 
    "CES", "CES_komentar", "Kategorie"]]);
    // Column names to work with

    // Add a new table at range A1:K1 on selectedSheet
    // Optional if you want to use ADD Row Into Table

    selectedSheet.setName(sheetname);



    //Populate rows below Header Row with Array Variable 
    const starterrow = 2; //Starting row for "table" data

    for (let i = 0; i < arrayfromflow.length; i++) {
        const currentObject = arrayfromflow[i];

        const formattedrow = [[currentObject.ID, currentObject.Cele_jmeno, currentObject.Datum_dotazovani, currentObject.Mesic_odpovedi, currentObject.Trigger, currentObject.CSI, 
            currentObject.CSI_komentar, currentObject.Provedene_zmeny, currentObject.CC_schuzky, currentObject.Domovske_CC, currentObject.HUB, currentObject.Oblast, currentObject.Reklamace_manager, 
            currentObject.Poznamka, currentObject.Zmena, currentObject.Odeslano, currentObject.Odeslano_stav, currentObject.Pobocka, currentObject.NPS, currentObject.NPS_komentar
            , currentObject.CES, currentObject.CES_komentar, currentObject.Kategorie]];

        const rowRange = `A${starterrow + i}:W${starterrow + i}`;
        selectedSheet.getRange(rowRange).setValues(formattedrow);
    }

  const usedRange = selectedSheet.getUsedRange();
  // Create a table using the data range.
  let newTable = workbook.addTable(selectedSheet.getUsedRange(), true);
  newTable.setName(myTableName);
  newTable.getRange().getFormat().autofitColumns();
  newTable.getRange().getFormat().setHorizontalAlignment(ExcelScript.HorizontalAlignment.left);
  newTable.getRange().getFormat().setVerticalAlignment(ExcelScript.VerticalAlignment.top);
  // Set calculation mode back to automatic
  workbook.getApplication().setCalculationMode(ExcelScript.CalculationMode.automatic);
}

// Defining Interfaces for MultiVar and Array
// Column names to work with
interface arrayofdata {
    ID: string,
    Cele_jmeno: string,
    Datum_dotazovani: string,
    Mesic_odpovedi: string,
    Trigger: string,
    CSI: string,
    CSI_komentar: string,
    Provedene_zmeny: string,
    CC_schuzky: string,
    Domovske_CC: string,
    HUB: string,
    Oblast: string,
    Reklamace_manager: string,
    Poznamka: string,
    Zmena: string,
    Odeslano: string,
    Odeslano_stav: string,
    Pobocka: string, 
    NPS: string,
    NPS_komentar: string,
    CES: string,
    CES_komentar: string,
    Kategorie: string
}

