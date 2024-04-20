Set(_selectedMenuItem, ThisItem);
If(
    ThisItem.Row = 1, Navigate(InitiativesPage, Fade),
    ThisItem.Row = 2, Navigate(MyOpenApprovals, Fade),
    ThisItem.Row = 3, Navigate(MyOpenBenefits, Fade),
    ThisItem.Row = 4, Navigate(Documentation, Fade),
    ThisItem.Row = 5, Navigate(CatTreeList, Fade),
    ThisItem.Row = 6, Navigate(DivTreeList, Fade),
    ThisItem.Row = 7, Navigate(Controlling, Fade),
    ThisItem.Row = 8, Navigate(AllBenefits, Fade),
    ThisItem.Row = 9, Navigate(SetPermissions, Fade),
    ThisItem.Row = 10, Navigate(FindInitiative, Fade)

);


ContainerHeaderDetailCat.Width - iconEdit_6.Width - iconClose_6.Width

#DHL Yellow
RGBA(255, 203, 46, 1)

#Light Gray¨
RGBA(237, 237, 237, 1)

If(varRecord.InitiativeStatus.Value = "Draft", RGBA(255, 203, 46, 1), RGBA(237, 237, 237, 1))

LookUp(Initiatives, ID = varRecord.ID)