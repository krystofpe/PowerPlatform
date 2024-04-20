Switch(
    varUserRole;
    "Admin";
    ForAll(
        colCheckItems As aRecord;
        Patch(
            Evidence;
            LookUp(
                Evidence;
                ID = aRecord.ID
            );
            {
                'Místo vyzvednutí': TextInput1_1.Text;
                'Datum a čas vyzvednutí od': casVyzvednuti_1.SelectedDate + Time(
                    Value(Dropdown_Hours_1.Selected.Value);
                    Value(Dropdown_Minutes_1.Selected.Value);
                    0
                );
                'Datum a čas vyzvednutí do': casVyzvednuti_2.SelectedDate + Time(
                    Value(Dropdown_Hours_2.Selected.Value);
                    Value(Dropdown_Minutes_2.Selected.Value);
                    0
                );
                'Kontaktní osoba': {
                    DisplayName: If(
                        Len(cbxContact_1.Selected.Mail) = 0;
                        aRecord.BlankPerson.DisplayName;
                        cbxContact_1.Selected.DisplayName
                    );
                    Claims: If(
                        Len(cbxContact_1.Selected.Mail) = 0;
                        aRecord.BlankPerson.Claims;
                        "i:0#.f|membership|" & cbxContact_1.Selected.Mail
                    );
                    Department: "";
                    Email: If(
                        Len(cbxContact_1.Selected.Mail) = 0;
                        aRecord.BlankPerson.Email;
                        cbxContact_1.Selected.Mail
                    );
                    JobTitle: "";
                    Picture: ""
                };
                'Telefon - Kontaktní osoba': TextInput3_4.Text;
                'Tržní cena ': Value(TextInput1.Text)
            }
        )
    )
)