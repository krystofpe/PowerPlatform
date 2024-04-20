ClearCollect(
    colMenu;
    Table(
        {
            MenuLabel: "Report - Týden";
            MenuIcon: Icon.DocumentWithContent;
            MenuScreenNavigate: Week;
            MenuID: 1;
            SubMenu: Table()
        };
        {
            MenuLabel: "Report - Měsíc";
            MenuIcon: Icon.ListScrollWatchlist;
            MenuScreenNavigate: Month;
            MenuID: 2;
            SubMenu: Table()
        };
        {
            MenuLabel: "Report - CSF";
            MenuIcon: Icon.LogJournal;
            MenuScreenNavigate: Overview;
            MenuID: 3;
            SubMenu: Table()
        }
    )
)