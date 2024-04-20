UpdateContext({varPopUpSpinner: true});;
IfError(
    Patch(
        'RB Nápady HYPO';
        LookUp(
            'RB Nápady HYPO';
            ID = varRecord.ID
        );
        {
            Název: input_nazevInProgress.Text;
            'Kategorie nápadu': {Value: cbx_kategorieInProgress.Selected.Title};
            'Současný stav': input_soucasnyStavInProgress.Text;
            'Budoucí stav': input_budouciStavInProgress.Text;
            Hypocentrum: cbx_hypocentrumInProgress.Selected.Title;
            'Úspora času v jednom případě': Value(input_usporaCasuInProgress.Text);
            'Četnost týdně': Value(input_cetnostTydneInProgress.Text);
            'Jiné benefity': Concat(
                Distinct(
                    colJineBenefity;
                    Value
                );
                Value;
                Char(10)
            );
            Řešitel: {
                DisplayName: cbx_resitelInProgress.Selected.DisplayName;
                Claims: cbx_resitelInProgress.Selected.Mail;
                Department: "";
                Email: cbx_resitelInProgress.Selected.Mail;
                JobTitle: "";
                Picture: ""
            };
            'Stav WF': {Value: cbx_Status.Selected.Title};
            'Termín realizace/zamítnutí': date_terminInProgress.SelectedDate;
            //If(cbx_Status.Selected.Title = "Zamítnuto"; Today(); date_terminInProgress.SelectedDate);
'Termín ralizace/zamítnutí rok': Year(Today());
            'Termín realizace/zamítnutí měsíc': Month(Today());
            'Komentář k benefitům': input_komentarBenefityInProgress.Text;
            'Úspora času hod/rok': Value(input_rocniUspora.Text);
            'Úspora nákladů Kč/rok (nezahrnuje čas)': Value(input_usporNakladuInProgress.Text);
            'Celková přepočtená úspora Kč/rok': Value(input_celkovaUspora.Text);
            'Historie status': {Value: cbx_Status.Selected.Title};
            'Komentář ke statusu': input_komentarStatus.Text
            /*
            varRecord.'Komentář ke statusu' & If(
                Len(varRecord.'Komentář ke statusu') = 0;
                "";
                Char(10)
            ) & User().FullName & " (" & Text(
                Today();
                "dd.mm.yyyy"
            ) & "): " & Substitute(
                input_komentarStatus.Text; //input_komentarStatus_edit.Text
                Char(10);
                " "
            )
            */
        };
        attachmentsFormInProgress.Updates
    );
    Notify(
        "Něco se pokazilo, zkuste to prosím později. Pokud problémy přetrvají, kontaktujte administrátora.";
        NotificationType.Error
    );
    Notify(
        "Změny uloženy.";
        NotificationType.Success
    );;
    If(
        varRecord.'Stav WF'.Value <> cbx_Status.Selected.Title;
        Switch(
            cbx_Status.Selected.Title;
            "V prioritizaci";
            RB_HYPO_Nápady_Notifikace_Autor_Prioritizace.Run(
                {
                    text: Lower(User().Email);
                    text_1: LookUp(
                        'RB Nápady HYPO';
                        ID = varRecord.ID
                    ).ID;
                    text_2: input_komentarStatus.Text;
                    text_3: cbx_autorNapaduInProgress.Selected.Mail;
                    text_4: "" //UživateléOffice365.Manager(cbx_autorNapaduInProgress.Selected.Id).Mail
                }
            );
            "Rozpracováno";
            RB_HYPO_Nápady_Notifikace_Autor_Rozpracováno.Run(
                {
                    text: User().Email;
                    text_1: LookUp(
                        'RB Nápady HYPO';
                        ID = varRecord.ID
                    ).ID;
                    text_2: input_komentarStatus.Text;
                    text_3: cbx_autorNapaduInProgress.Selected.Mail;
                    text_4: "" //UživateléOffice365.Manager(cbx_autorNapaduInProgress.Selected.Id).Mail
                }
            );
            "Realizováno";
            RB_HYPO_Nápady_Notifikace_Autor_Realizováno.Run(
                {
                    text: User().Email;
                    text_1: LookUp(
                        'RB Nápady HYPO';
                        ID = varRecord.ID
                    ).ID;
                    text_2: input_komentarStatus.Text;
                    text_3: cbx_autorNapaduInProgress.Selected.Mail;
                    text_4: UživateléOffice365.Manager(cbx_autorNapaduInProgress.Selected.Id).Mail
                }
            );
            "Zamítnuto";
            RB_HYPO_Nápady_Notifikace_Autor_Zamítnuto.Run(
                {
                    text: User().Email;
                    text_1: LookUp(
                        'RB Nápady HYPO';
                        ID = varRecord.ID
                    ).ID;
                    text_2: input_komentarStatus.Text;
                    text_3: cbx_autorNapaduInProgress.Selected.Mail;
                    text_4: UživateléOffice365.Manager(cbx_autorNapaduInProgress.Selected.Id).Mail
                }
            )
            ;
            "Duplicita";
            RB_HYPO_Nápady_Notifikace_Autor_Zamítnuto.Run(
                {
                    text: User().Email;
                    text_1: LookUp(
                        'RB Nápady HYPO';
                        ID = varRecord.ID
                    ).ID;
                    text_2: input_komentarStatus.Text;
                    text_3: cbx_autorNapaduInProgress.Selected.Mail;
                    text_4: UživateléOffice365.Manager(cbx_autorNapaduInProgress.Selected.Id).Mail
                }
            )
            ;
             "Zaparkováno";
            RB_HYPO_Nápady_Notifikace_Autor_Zamítnuto.Run(
                {
                    text: User().Email;
                    text_1: LookUp(
                        'RB Nápady HYPO';
                        ID = varRecord.ID
                    ).ID;
                    text_2: input_komentarStatus.Text;
                    text_3: cbx_autorNapaduInProgress.Selected.Mail;
                    text_4: UživateléOffice365.Manager(cbx_autorNapaduInProgress.Selected.Id).Mail
                }
            )
        )
    )
);;
UpdateContext({varPopUpFormConfirm: false});;
UpdateContext({varPopUpSpinner: false});;
UpdateContext({varPopUpFormInProgress: false});;
Set(
    varRecord;
    Blank()
);;
Reset(input_nazevInProgress);;
Reset(dp_kategorieInProgress);;
Reset(cbx_autorNapaduInProgress);;
Reset(cbx_kategorieInProgress);;
Reset(cbx_hypocentrumInProgress);;
Reset(input_usporaCasuInProgress);;
Reset(input_cetnostTydneInProgress);;
Reset(CheckboxInProgress_1);;
Reset(CheckboxInProgress_2);;
Reset(CheckboxInProgress_3);;
Reset(CheckboxInProgress_4);;
Reset(CheckboxInProgress_5);;
Reset(input_soucasnyStavInProgress);;
Reset(input_budouciStavInProgress);;
Reset(input_komentarBenefityInProgress);;
Reset(input_komentarInProgress);;
Reset(input_usporNakladuInProgress);;
Reset(cbx_Status);;
Reset(input_rocniUspora);;
Reset(input_celkovaUspora);;
Reset(input_komentarStatus);;
Reset(cbx_resitelInProgress);;
Reset(date_terminInProgress);;
UpdateContext({locUsporaCasu2: Blank()});;
UpdateContext({locCetnostTydne2: Blank()});;
UpdateContext({locUsporaNakladu2: Blank()});;
UpdateContext({locRocniUspora2: Blank()});;
Reset(input_komentarStatus_edit)