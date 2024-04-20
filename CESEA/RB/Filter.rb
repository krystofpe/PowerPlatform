SortByColumns(
        Filter(
            AddColumns(AddColumns(AddColumns('RB Nápady HYPO'; "AutorNapadu"; 'Autor nápadu'.DisplayName); "KategorieNapadu"; 'Kategorie nápadu'.Value); "Status"; 'Stav WF'.Value);
            //colRBHypo;
            'Stav WF'.Value = "Čeká na Mortgage Loans" Or 'Stav WF'.Value = "čeká na Mortgage Loans" Or 'Stav WF'.Value = "Rozpracováno" Or 'Stav WF'.Value = "rozpracováno" Or 'Stav WF'.Value = "V prioritizaci"  Or 'Stav WF'.Value = "v prioritizaci" Or 'Stav WF'.Value = "Evidováno" Or 'Stav WF'.Value = "evidováno"; // Or 'Stav WF'.Value = "Zaparkováno" Or 'Stav WF'.Value = "zaparkováno";
            input_InProgressFinished.Text in Název Or input_InProgressFinished.Text in Autor.DisplayName Or input_InProgressFinished.Text in Hypocentrum Or input_InProgressFinished.Text in Text('Celková přepočtená úspora Kč/rok') Or input_InProgressFinished.Text in ID;
            cbx_kategorieFilterInProgress.Selected.Value.Value = 'Kategorie nápadu'.Value Or cbx_kategorieFilterInProgress.Selected.Value.Value = Blank();
            cbx_hypocentrumFilterInProgress.Selected.Value = Hypocentrum Or cbx_hypocentrumFilterInProgress.Selected.Value = Blank();
            cbx_filterStatusInProgress.Selected.Value.Value = 'Stav WF'.Value Or cbx_filterStatusInProgress.Selected.Value.Value = Blank();
            cbx_filterAuthorInProgress.Selected.Value = 'Autor nápadu'.DisplayName Or cbx_filterAuthorInProgress.Selected.Value = Blank();
            Vytvořeno >= dp_filterOdInProgress.SelectedDate And Vytvořeno <= dp_filterDoInProgress.SelectedDate
        );
        Switch(
            varSortColumn;
            "Title";
            "Title";
            "field_2";
            "field_2";
            "field_3";
            "field_3";
            "Created";
            "Created";
            "KategorieNapadu";
            "KategorieNapadu";
            "field_10";
            "field_10";
            "field_12";
            "field_12";
            "Status";
            "Status"
        );
        If(
            varGallerySort;
            SortOrder.Ascending;
            SortOrder.Descending
        )
    )