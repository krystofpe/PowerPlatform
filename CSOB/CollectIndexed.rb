Refresh('M365 Summit - Demo List');;
Clear(colIndexedData);;
With(
    {
        firstIndex: First(
            SortByColumns(
                'M365 Summit - Demo List';
                "Index";
                SortOrder.Ascending
            )
        ).Index;
        lastIndex: First(
            SortByColumns(
                'M365 Summit - Demo List';
                "Index";
                SortOrder.Descending
            )
        ).Index
    };
    ForAll(
        Sequence(
            RoundUp(
                (lastIndex - firstIndex) / 2000;
                0
            );
            1;
            1
        );
        With(
            {
                currentIndexStart: firstIndex + (2000 * (ThisRecord.Value - 1));
                currentIndexEnd: firstIndex + (2000 - 1) * ThisRecord.Value
            };
            Collect(colIndexedData; {currentIndexStart: currentIndexStart; currentIndexEnd: currentIndexEnd});;
            Collect(
                colIndexedData;
                Filter(
                    'M365 Summit - Demo List';
                    Index >= currentIndexStart And Index < currentIndexEnd
                )
            )
        )
    )
);;