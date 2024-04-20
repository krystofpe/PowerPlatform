Refresh('M365 Summit - Demo List');;
Clear(colPartFinal);;
Concurrent(
    ClearCollect(
        colPartA;
        Sort(
            'M365 Summit - Demo List';
            ID;
            SortOrder.Ascending
        )
    );
    ClearCollect(
        colPartB;
        Sort(
            'M365 Summit - Demo List';
            ID;
            SortOrder.Descending
        )
    )
);;
ClearCollect(
    colPartFinal;
    colPartA;
    Filter(
        colPartB;
        Not(ID in colPartA.ID)
    )
);;
Clear(colPartA);;
Clear(colPartB);;