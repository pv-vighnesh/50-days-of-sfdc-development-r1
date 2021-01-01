@isTest
private class WarrantySummaryTest {
    @isTest
    static void WarrantySummaryTest() {
        Case myCase = new Case();
        myCase.Product_Purchase_Date__c = date.today();
        myCase.Product_Total_Warranty_Days__c = 10;
        myCase.Product_Has_Extended_Warranty__c = true;
        insert myCase;
    }
}
