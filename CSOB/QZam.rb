Office365Users.SearchUser({searchTerm:ComboBox1.SearchText}).DisplayName

UživateléOffice365.SearchUser({searchTerm: InputName.Text})

Patch(Nominace; ThisItem; {'Počet hlasů':ThisItem.'Počet hlasů'+1})

If(User().Email = "JF05846@KBC-GROUP.COM"; true; false)
 
UpdateContext ({varDisplayMode : DisplayMode.Disabled})

Collect(NominatedUsersCollection;{Name_Col:Name2.Text;JobTitle_Col:Pozice2.Text;Department_Col:Department2.Text;Reason_Col:InputReason.Text;Benefit_Col:InputBenefit.Text});;ForAll(NominatedUsersCollection;

Set(varSearch;LookUp(Nominace;Name=Name2.Text));;

If(IsEmpty(varSearch);

	Patch(Nominace;Defaults(Nominace);{Name:Name_Col;JobTitle:JobTitle_Col;Department:Department_Col;'Reason of nomination':Reason_Col;'Benefit for organization':Benefit_Col}));;Navigate(ThankYouScreen;ScreenTransition.Fade);;

Navigate(ThankYouScreen;ScreenTransition.Fade)

Patch(Nominace; Name=Name2.Text; {'Reason of nomination': Nominace.'Reason of nomination' & "; " & InputReason.Text})

Patch(Nominace; BrowseUsers.Selected; {'Počet hlasů':BrowseUsers.Selected.'Počet hlasů'+1});; Patch('Přístupy - VIP'; LookUp('Přístupy - VIP'; Název = User().Email); {'Počet hlasů': varUser.'Počet hlasů' -1});; Set(varUser; LookUp('Přístupy - VIP'; Název = User().Email))


Patch(Nominace;BrowseUsers.Selected;{Po_x010d_et_x0020_hlas_x016f_:BrowseUsers.Selected.Po_x010d_et_x0020_hlas_x016f_+1});;

Set(varUser;LookUp('Přístupy - VIP'; Mail=User().Email));; 

Patch('Přístupy - VIP'; LookUp('Přístupy - VIP'; Mail = User().Email); {'Udělené hlasy': Concatenate(varUser.'Udělené hlasy'; "; ";BrowseUsers.Selected.Title); 'Počet hlasů':varUser.'Počet hlasů'-1});;

Set(varUser; LookUp('Přístupy - VIP'; Mail=User().Email))

BrowseUser

visible: If(IsEmpty(varUser.'Počet hlasů'); DisplayMode.Disabled; true; false)


Button1
	OnSelect: If(BrowseUsers.Selected.Name in varUser.Ud_x011b_len_x00e9_hlasy; DisplayMode.Disabled; DisplayMode.Edit)
	Text: If(Button1.DisplayMode = DisplayMode.Edit; "Udělit hlas"; "Hlas udělen")


#SK tým
#IT pro pobočky a podpůrné domény
#IT Služby
#IT Office
#IT Service and Testing
#IT pro ČSOBP
#IT Systems of Record
#Inteligentní procesní automatizace


BrowseUsers filter:
SortByColumns(Filter([@Nominace]; StartsWith(Name; SearchUser2.Text)); "Title"; If(SortDescending1; Descending; Ascending))

Udělit hlas:
If(BrowseUsers.Selected.Name in varUser.Ud_x011b_len_x00e9_hlasy; DisplayMode.Disabled; DisplayMode.Edit)