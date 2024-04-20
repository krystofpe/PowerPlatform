UpdateContext({varSpinnerOdeslat: true});;
Refresh(tblRTP_VracenaPostas);;
ForAll(
    colScannedCodes As aRecord;
    Patch(
        tblRTP_VracenaPostas;
        Defaults(tblRTP_VracenaPostas);
        {
            //Id: GUID();
            CK: aRecord.Barcode;
            KodZasilky: Value(Left(aRecord.Barcode; 3));
            CIF: If(Value(Left(aRecord.Barcode; 3)) = 001; If((Value(Left(aRecord.Barcode; 3)) = 001 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2013";"cs-CZ"))); Mid(aRecord.Barcode; 4; 12); Mid(aRecord.Barcode; 5; 13))) & 
                If(Value(Left(aRecord.Barcode; 3)) = 002; If((Value(Left(aRecord.Barcode; 3)) = 002 And DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2014";"cs-CZ")); Mid(aRecord.Barcode; 4; 12); Mid(aRecord.Barcode; 5; 13))) &
                If(Value(Left(aRecord.Barcode; 3)) = 003; If((Value(Left(aRecord.Barcode; 3)) = 003 And DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2015";"cs-CZ")); Mid(aRecord.Barcode; 4; 12); Mid(aRecord.Barcode; 5; 13))) &
                If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 4; 14)) &
                If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) > 26; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 005; Mid(aRecord.Barcode; 5; (Len(aRecord.Barcode) - 10))) &
                If(Value(Left(aRecord.Barcode; 3)) = 006; Mid(aRecord.Barcode; 5; (Len(aRecord.Barcode) - 10))) &
                If(Value(Left(aRecord.Barcode; 3)) = 007; Mid(aRecord.Barcode; 5; (Len(aRecord.Barcode) - 10))) &
                If(Value(Left(aRecord.Barcode; 3)) = 010; Mid(aRecord.Barcode; 4; 9)) &
                If(Value(Left(aRecord.Barcode; 3)) = 011; Mid(aRecord.Barcode; 4; 8)) &
                If(Value(Left(aRecord.Barcode; 3)) = 030; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 031; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 032; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 033; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 034 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 4; 14)) &
                If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 4; 14)) &
                If(Value(Left(aRecord.Barcode; 3)) = 040 And Len(aRecord.Barcode) = 16; Mid(aRecord.Barcode; 10; 6)) &
                If(Value(Left(aRecord.Barcode; 3)) = 040 And Or(Len(aRecord.Barcode) = 25; Len(aRecord.Barcode) = 26); Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 041 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 042 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 043 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 073; Mid(aRecord.Barcode; 4; 14));
            VypSkup: If((Value(Left(aRecord.Barcode; 3)) = 001 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2013";"cs-CZ"))); Mid(aRecord.Barcode; 16; 3)) & 
                     If((Value(Left(aRecord.Barcode; 3)) = 002 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2014";"cs-CZ"))); Mid(aRecord.Barcode; 16; 3)) &
                     If((Value(Left(aRecord.Barcode; 3)) = 003 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2015";"cs-CZ"))); Mid(aRecord.Barcode; 16; 3)) &
                     If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) > 26; Mid(aRecord.Barcode; 16; 3));
            IDVS_OA: If(Value(Left(aRecord.Barcode; 3)) = 001; If((Value(Left(aRecord.Barcode; 3)) = 001 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2013";"cs-CZ"))); Mid(aRecord.Barcode; 4; 12); Mid(aRecord.Barcode; 5; 13))) & 
                If(Value(Left(aRecord.Barcode; 3)) = 002; If((Value(Left(aRecord.Barcode; 3)) = 002 And DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2014";"cs-CZ")); Mid(aRecord.Barcode; 4; 12); Mid(aRecord.Barcode; 5; 13))) &
                If(Value(Left(aRecord.Barcode; 3)) = 003; If((Value(Left(aRecord.Barcode; 3)) = 003 And DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2015";"cs-CZ")); Mid(aRecord.Barcode; 4; 12); Mid(aRecord.Barcode; 5; 13))) &
                If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 4; 14)) &
                If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) > 26; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 005; Mid(aRecord.Barcode; 5; (Len(aRecord.Barcode) - 10))) &
                If(Value(Left(aRecord.Barcode; 3)) = 006; Mid(aRecord.Barcode; 5; (Len(aRecord.Barcode) - 10))) &
                If(Value(Left(aRecord.Barcode; 3)) = 007; Mid(aRecord.Barcode; 5; (Len(aRecord.Barcode) - 10))) &
                If(Value(Left(aRecord.Barcode; 3)) = 010; Mid(aRecord.Barcode; 4; 9)) &
                If(Value(Left(aRecord.Barcode; 3)) = 011; Mid(aRecord.Barcode; 4; 8)) &
                If(Value(Left(aRecord.Barcode; 3)) = 030; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 031; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 032; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 033; Mid(aRecord.Barcode; 5; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 034 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 4; 14)) &
                If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 4; 14)) &
                If(Value(Left(aRecord.Barcode; 3)) = 040 And Len(aRecord.Barcode) = 16; Mid(aRecord.Barcode; 10; 6)) &
                If(Value(Left(aRecord.Barcode; 3)) = 040 And Or(Len(aRecord.Barcode) = 25; Len(aRecord.Barcode) = 26); Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 041 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 042 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 043 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 4; 12)) &
                If(Value(Left(aRecord.Barcode; 3)) = 073; Mid(aRecord.Barcode; 4; 14));
            Capitol_IdCK: ""; //není definováno v mapping file
            Frekvence: If(Value(Left(aRecord.Barcode; 3)) = 001 And Not((Value(Left(aRecord.Barcode; 3)) = 001 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2013";"cs-CZ")))); Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 002 And Not((Value(Left(aRecord.Barcode; 3)) = 002 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2014";"cs-CZ")))); Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 003 And Not((Value(Left(aRecord.Barcode; 3)) = 003 And (DateValue(Left(Mid(aRecord.Barcode; 19; 6); 2) & "/" & Mid(Mid(aRecord.Barcode; 19; 6); 3; 2) & "/" & "20" & Right(Mid(aRecord.Barcode; 19; 6); 2); "cs-CZ") < DateValue("22.02.2015";"cs-CZ")))); Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Or(Len(aRecord.Barcode) = 25; Len(aRecord.Barcode) = 26); "ID_VS") &
                        If(Value(Left(aRecord.Barcode; 3)) = 041 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 042 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 18; 1)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 043 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 18; 1));
            DatTisk: Left(If(Value(Left(aRecord.Barcode; 3)) = 001; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 002; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 003; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) > 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 005; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 006; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 007; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 010; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 011; Right(aRecord.Barcode; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 030; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 031; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 032; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 033; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 034 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 16; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 16; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Len(aRecord.Barcode) = 16; Mid(aRecord.Barcode; 4; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Or(Len(aRecord.Barcode) = 25; Len(aRecord.Barcode) = 26); Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 041 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 042 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 043 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 073; Mid(aRecord.Barcode; 19; 6)); 2) & "." & Mid(If(Value(Left(aRecord.Barcode; 3)) = 001; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 002; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 003; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) > 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 005; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 006; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 007; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 010; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 011; Right(aRecord.Barcode; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 030; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 031; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 032; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 033; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 034 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 16; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 16; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Len(aRecord.Barcode) = 16; Mid(aRecord.Barcode; 4; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Or(Len(aRecord.Barcode) = 25; Len(aRecord.Barcode) = 26); Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 041 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 042 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 043 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 073; Mid(aRecord.Barcode; 19; 6)); 2; 2) & ".20" & Right(If(Value(Left(aRecord.Barcode; 3)) = 001; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 002; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 003; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 004 And Len(aRecord.Barcode) > 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 005; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 006; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 007; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 010; Right(aRecord.Barcode; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 011; Right(aRecord.Barcode; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 5; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 17; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 030; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 031; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 032; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 033; Mid(aRecord.Barcode; 5; 12)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 034 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 16; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 16; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 26; Mid(aRecord.Barcode; 19; 6)) &

                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Len(aRecord.Barcode) = 16; Mid(aRecord.Barcode; 4; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 040 And Or(Len(aRecord.Barcode) = 25; Len(aRecord.Barcode) = 26); Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 041 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 042 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 043 And Left(Right(aRecord.Barcode; 2); 1) = "0"; Mid(aRecord.Barcode; 19; 6)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 073; Mid(aRecord.Barcode; 19; 6)); 2);
            DatVraceni: Text(Today(); "dd.mm.yy");
            KodDuvodVraceni: LookUp(tblRTPDuvodVraceni; DuvodVraceni = aRecord.DuvodVraceni).KodDuvodVraceni ;
            PoradiVRamciDne: "";
            Delete: "NEPRAVDA";
            CasNacteni: Text(Now(); "dd.mm.yy hh:mm");
            CisloJednaci: If(Value(Left(aRecord.Barcode; 3)) = 020 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 11; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 020 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 23; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 11; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 021 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 23; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 11; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 022 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 23; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Len(aRecord.Barcode) = 18; Mid(aRecord.Barcode; 11; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 023 And Or(Len(aRecord.Barcode) = 29; Len(aRecord.Barcode) = 30); Mid(aRecord.Barcode; 23; 7)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 030; Mid(aRecord.Barcode; 23; 9)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 031; Mid(aRecord.Barcode; 23; 9)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 032; Mid(aRecord.Barcode; 23; 9)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 033; Mid(aRecord.Barcode; 23; 9)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 034 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 22; 8)) &
                        If(Value(Left(aRecord.Barcode; 3)) = 035 And Len(aRecord.Barcode) = 30; Mid(aRecord.Barcode; 22; 8));
            ZmenaAdresy: "NEPRAVDA";
            H_Del: "NEPRAVDA";
            Capitol_Cache_Id: ""; 
            KodPodatelny: "ČSOB CZ";
            ZpracovalDatum: "";
            ZpracovalID: UživateléOffice365.MyProfileV2().mailNickname;
            ZpracovalJmeno: UživateléOffice365.MyProfileV2().displayName

        }
    )
);;
ForAll(
    colScannedCodes As aRecord;
    Patch(
        tblAuditTrail;
        Defaults(tblAuditTrail);
        {
            ChangeAction: "INSERT";
            TableName: "tblRTP_VracenaPosta";
            Record: aRecord.Barcode;
            ChangeDate: Text(Now(); "dd.mm.yy hh:mm");
            ChangeBy: UživateléOffice365.MyProfileV2().mailNickname
        }
    )
);;
UpdateContext({varSpinnerOdeslat: false});;
UpdateContext({varPopUpOdeslat: false});;
Notify(
    "Položky uloženy do databáze.";
    NotificationType.Success
)