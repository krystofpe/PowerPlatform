Switch(
    varUserRole;
    "Admin";
    Patch(
        Evidence;
        LookUp(
            Evidence;
            'Inventární číslo' = varRecordEvidence.'Inventární číslo'
        );
        {
            'Místo vyzvednutí': TextInput3_2.Text;
            'Datum a čas vyzvednutí od': casVyzvednuti.SelectedDate + Time(
                Value(Dropdown_Hours.Selected.Value);
                Value(Dropdown_Minutes.Selected.Value);
                0
            );
            'Datum a čas vyzvednutí do': casVyzvednuti_3.SelectedDate + Time(
                Value(Dropdown_Hours_3.Selected.Value);
                Value(Dropdown_Minutes_3.Selected.Value);
                0
            );
            'Kontaktní osoba': {
                DisplayName: If(Len(cbxContact.Selected.Mail) = 0; varRecordEvidence.BlankPerson.DisplayName; cbxContact.Selected.DisplayName);
                Claims: If(Len(cbxContact.Selected.Mail) = 0; varRecordEvidence.BlankPerson.Claims; "i:0#.f|membership|" & cbxContact.Selected.Mail);
                Department: "";
                Email: If(Len(cbxContact.Selected.Mail) = 0; varRecordEvidence.BlankPerson.Email; cbxContact.Selected.Mail);
                JobTitle: "";
                Picture: ""
            };
            'Telefon - Kontaktní osoba': TextInput3.Text;
            'Tržní cena ': Value(input_Cena.Text);
            Komentář: TextInput3_3.Text
        }
    );
    "Technik";
    Patch(
        Evidence;
        LookUp(
            Evidence;
            'Inventární číslo' = varRecordEvidence.'Inventární číslo'
        );
        {
            'Místo vyzvednutí': TextInput3_2.Text;
            'Datum a čas vyzvednutí od': casVyzvednuti.SelectedDate + Time(
                Value(Dropdown_Hours.Selected.Value);
                Value(Dropdown_Minutes.Selected.Value);
                0
            );
             'Datum a čas vyzvednutí do': casVyzvednuti_3.SelectedDate + Time(
                Value(Dropdown_Hours_3.Selected.Value);
                Value(Dropdown_Minutes_3.Selected.Value);
                0
            );
            'Kontaktní osoba': {
                DisplayName: If(Len(cbxContact.Selected.Mail) = 0; varRecordEvidence.BlankPerson.DisplayName; cbxContact.Selected.DisplayName);
                Claims: If(Len(cbxContact.Selected.Mail) = 0; varRecordEvidence.BlankPerson.Claims; "i:0#.f|membership|" & cbxContact.Selected.Mail);
                Department: "";
                Email: If(Len(cbxContact.Selected.Mail) = 0; varRecordEvidence.BlankPerson.Email; cbxContact.Selected.Mail);
                JobTitle: "";
                Picture: ""
            };
            'Telefon - Kontaktní osoba': TextInput3.Text;
            Komentář: TextInput3_3.Text
        }
    );
    "Oceňovač";
    Patch(
        Evidence;
        LookUp(
            Evidence;
            'Inventární číslo' = varRecordEvidence.'Inventární číslo'
        );
        {'Tržní cena ': Value(input_Cena.Text)}
    )
);;
Refresh(Evidence);;
ClearCollect(
    colAllItems;
    Evidence
);;
Notify("Změny uloženy."; NotificationType.Success)