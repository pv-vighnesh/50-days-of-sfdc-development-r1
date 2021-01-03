@isTest
private class CheckSecretInformationTest {
    @IsTest
    static void createCase(){
        
        // Case creation
        Case myCase         = new Case();
        myCase.Status       = 'New';
        myCase.Origin       = 'Phone';
        myCase.Subject      = 'Not same as Child';
        myCase.Description  = 'Contains Passport';

        // Using DML explixitely to insert new Case 
        insert myCase;

        Test.startTest();
        /* System.runAs(contextuser){
            
        } */
        Test.stopTest();
        
    }
}
