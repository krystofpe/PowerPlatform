var Sdk = window.Sdk || {};
 
(function () {
 
    this.onClickErrorNotification = function(PrimaryControl) {
 
        Xrm.Page.ui.clearFormNotification();
        Xrm.Page.ui.setFormNotification("Ukázka chybové notifikace", "ERROR");
    }
 
    this.onClickWarningNotification = function(PrimaryControl) {
 
        Xrm.Page.ui.clearFormNotification();
        Xrm.Page.ui.setFormNotification("Ukázka varovné notifikace", "WARNING");
    }
 
    this.onClickInfogNotification = function(PrimaryControl) {
 
        Xrm.Page.ui.clearFormNotification();
        Xrm.Page.ui.setFormNotification("Ukázka informační notifikace", "INFO");
    }
 
    this.onClickAllgNotification = function(PrimaryControl) {
 
        Xrm.Page.ui.clearFormNotification();
 
        Xrm.Page.ui.setFormNotification("Ukázka chybové notifikace", "ERROR");
        Xrm.Page.ui.setFormNotification("Ukázka varovné notifikace", "WARNING");
        Xrm.Page.ui.setFormNotification("Ukázka informační notifikace", "INFO");
    }
 
 
}).call(Sdk);