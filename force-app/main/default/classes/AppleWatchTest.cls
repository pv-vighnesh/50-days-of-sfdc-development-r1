@isTest
public class AppleWatchTest {
	@isTest
    static void createOpportunity() {
        Opportunity opp = new Opportunity();
        opp.Name		= 'Test';
        opp.StageName   = 'Prospecting';
        opp.CloseDate   = Date.today();
        insert opp;
    }
}