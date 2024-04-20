ClearCollect(
    colAutomate;
    MatchAll(
        varAutomate;
        "(""Item"":""(?<Item>[^""]*)"",""Column1"":""(?<Column1>[^""]*)"",""Column2"":""(?<Column2>[^""]*)"",""Column3"":""(?<Column3>[^""]*)"",""Column4"":""(?<Column4>[^""]*)"")"
    )
);;