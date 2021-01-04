trigger WarrantySummary on Case (before insert) {

    for (Case myCase : Trigger.new) {
        
        // Setting up variables to use in Summary field
        String purchaseDate         = myCase.Product_Purchase_Date__c.format();
        String createdDate          = DateTime.now().format(); //myCase.CreatedDate;
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) 
                                        / myCase.Product_Total_Warranty_Days__c)).setScale(2); // (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c); //100 * (purchaseDate.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c); //(Date.today() - purchaseDate) / warrantyDays;
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;

        // Populating the Case Summary field

        // trying to cover null pointer exception
        if (purchaseDate != null || warrantyDays != null || warrantyPercentage != null || hasExtendedWarranty != null) {
            myCase.Warranty_Summary__c  = 'Product purchased on ' + purchaseDate + ' '
            + 'and case is created on ' + createdDate + '.\n' 
            + 'Warranty is for ' + warrantyDays + ' '
            + 'Days and is ' + warrantyPercentage + ' % through it\'s warranty field.\n' 
            + 'Extended Warranty: ' + hasExtendedWarranty + '\n' 
            + 'Have a nice day!';
        }
    }

    /* Product purcahsed on <<purcahseDate>> and case created on <<createdDate>>,
    Warranty is for <<warrantyDays>> and is <<warranty Percentage>> through its warranty field.
    Extended Warranty: <<HasExtendedWarranty>>
    Have a nice day! */
}
