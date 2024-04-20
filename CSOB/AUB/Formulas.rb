gblNumberFormat = "#,##0.00";;
gblNumberFormatThreeDecimal = "#,##0.000";;
gblBlankLookup = {
    Id: -1;
    Value: Blank();
    Owner: Blank()
};;
gblTextColor = RGBA(0; 51; 102; 1);;
colMaturityStructureFormula = AddColumns(
    Filter(
        AUB_ComTransactionss;
        BankLookup.PROFNR = varSelectedBank.PROFNR
    ) As Tab1;
    "Outstanding_net";
    LookUp(
        AUB_Lists_ExchangeRatesEURs;
        CurrencyCode = Tab1.currency;
        If(
            Tab1.non_com;
            0;
            If(
                IsBlank(Tab1.amount);
                0;
                If(
                    Tab1.fully_covered;
                    0;
                    If(
                        Tab1.not_duly_repaid;
                        Tab1.amount / 1000000 / ExchangeRate;
//Outstand
//Outst_Till_8rep
                        (( If(
                            Tab1.non_com;
                            0;
                            If(
                                Tab1.final_maturity < Today();
                                0;
                                Tab1.amount / 1000000 / ExchangeRate - If(
                                    IsBlank(Tab1.part_rep_1_amount);
                                    0;
                                    Tab1.part_rep_1_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_1_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_2_amount);
                                    0;
                                    Tab1.part_rep_2_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_2_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_3_amount);
                                    0;
                                    Tab1.part_rep_3_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_3_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_4_amount);
                                    0;
                                    Tab1.part_rep_4_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_4_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_5_amount);
                                    0;
                                    Tab1.part_rep_5_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_5_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_6_amount);
                                    0;
                                    Tab1.part_rep_6_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_6_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_7_amount);
                                    0;
                                    Tab1.part_rep_7_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_7_date < Today();
                                        1;
                                        0
                                    )
                                ) - If(
                                    IsBlank(Tab1.part_rep_8_amount);
                                    0;
                                    Tab1.part_rep_8_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_8_date < Today();
                                        1;
                                        0
                                    )
                                )
                            )
                        ) ) 
//rep9_10
- ( If(
                            Tab1.non_com;
                            0;
                            If(
                                Tab1.final_maturity < Today();
                                0;
                                If(
                                    IsBlank(Tab1.part_rep_9_amount);
                                    0;
                                    Tab1.part_rep_9_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_9_date < Today();
                                        1;
                                        0
                                    )
                                ) + If(
                                    IsBlank(Tab1.part_rep_10_amount);
                                    0;
                                    Tab1.part_rep_10_amount / 1000000 / ExchangeRate * If(
                                        Tab1.part_rep_10_date < Today();
                                        1;
                                        0
                                    )
                                )
                            )
                        ) ))
                    )
                )
            )
        )
    );
    "Outstand";
    LookUp(
        AUB_Lists_ExchangeRatesEURs;
        CurrencyCode = Tab1.currency;
        If(
            Tab1.non_com;
            0;
            If(
                Tab1.final_maturity < Today();
                0;
                Tab1.amount / 1000000 / ExchangeRate - If(
                    IsBlank(Tab1.part_rep_1_amount);
                    0;
                    Tab1.part_rep_1_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_1_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_2_amount);
                    0;
                    Tab1.part_rep_2_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_2_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_3_amount);
                    0;
                    Tab1.part_rep_3_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_3_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_4_amount);
                    0;
                    Tab1.part_rep_4_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_4_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_5_amount);
                    0;
                    Tab1.part_rep_5_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_5_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_6_amount);
                    0;
                    Tab1.part_rep_6_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_6_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_7_amount);
                    0;
                    Tab1.part_rep_7_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_7_date < Today();
                        1;
                        0
                    )
                ) - If(
                    IsBlank(Tab1.part_rep_8_amount);
                    0;
                    Tab1.part_rep_8_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_8_date < Today();
                        1;
                        0
                    )
                )
            )
        ) - If(
            Tab1.non_com;
            0;
            If(
                Tab1.final_maturity < Today();
                0;
                If(
                    IsBlank(Tab1.part_rep_9_amount);
                    0;
                    Tab1.part_rep_9_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_9_date < Today();
                        1;
                        0
                    )
                ) + If(
                    IsBlank(Tab1.part_rep_10_amount);
                    0;
                    Tab1.part_rep_10_amount / 1000000 / ExchangeRate * If(
                        Tab1.part_rep_10_date < Today();
                        1;
                        0
                    )
                )
            )
        )
    );
    "Outstand_4Y";
    LookUp(
        AUB_Lists_ExchangeRatesEURs;
        CurrencyCode = Tab1.currency;
        If(
            (Tab1.final_maturity - Tab1.transaction_date) / 365 < 4;
            0;
            1
        ) * LookUp(
            AUB_Lists_ExchangeRatesEURs;
            CurrencyCode = Tab1.currency;
            If(
                Tab1.non_com;
                0;
                If(
                    Tab1.final_maturity < Today();
                    0;
                    Tab1.amount / 1000000 / ExchangeRate - If(
                        IsBlank(Tab1.part_rep_1_amount);
                        0;
                        Tab1.part_rep_1_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_1_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_2_amount);
                        0;
                        Tab1.part_rep_2_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_2_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_3_amount);
                        0;
                        Tab1.part_rep_3_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_3_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_4_amount);
                        0;
                        Tab1.part_rep_4_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_4_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_5_amount);
                        0;
                        Tab1.part_rep_5_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_5_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_6_amount);
                        0;
                        Tab1.part_rep_6_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_6_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_7_amount);
                        0;
                        Tab1.part_rep_7_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_7_date < Today();
                            1;
                            0
                        )
                    ) - If(
                        IsBlank(Tab1.part_rep_8_amount);
                        0;
                        Tab1.part_rep_8_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_8_date < Today();
                            1;
                            0
                        )
                    )
                )
            ) - If(
                Tab1.non_com;
                0;
                If(
                    Tab1.final_maturity < Today();
                    0;
                    If(
                        IsBlank(Tab1.part_rep_9_amount);
                        0;
                        Tab1.part_rep_9_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_9_date < Today();
                            1;
                            0
                        )
                    ) + If(
                        IsBlank(Tab1.part_rep_10_amount);
                        0;
                        Tab1.part_rep_10_amount / 1000000 / ExchangeRate * If(
                            Tab1.part_rep_10_date < Today();
                            1;
                            0
                        )
                    )
                )
            )
        )
    )
);;