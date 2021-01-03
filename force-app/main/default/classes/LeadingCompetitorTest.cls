@isTest
private class LeadingCompetitorTest {
    @IsTest
    static void addOpportunity(){
        
        // Creating Opportunity
        Opportunity opp = new Opportunity();
        opp.Name        = 'Test1';
        opp.StageName   = 'Prospecting';
        opp.CloseDate   = Date.today() + 30;
        
        // Must use DML to insert any newly created records in Test class
        insert opp;

        Test.startTest();
        //System.runAs(contextuser){
            
        }
        //Test.stopTest();
        
}