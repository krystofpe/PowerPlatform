Clear(colExportItems);
ForAll(
    Collection.AllItems As aRecord,
    Collect(
        colExportItems,
        {
            Column1: "Value1",
            Column2: "Value2"
        }
    )
);
Set(varExportResponse, PowerAutomate.Run(
    JSON(
        Collection,
        JSONFormat.IncludeBinaryData
    )).response
)