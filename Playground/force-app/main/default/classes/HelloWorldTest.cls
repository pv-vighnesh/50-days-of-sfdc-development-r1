@isTest
public class HelloWorldTest {
    @isTest
    static void updateLead() {
        Lead myLead = new Lead();
        myLead.FirstName = 'PV';
        myLead.LastName = 'Vighnesh';
        myLead.Company = 'UST';
        insert myLead;
        
        myLead.Company = 'Legato';
        update myLead;
    }

}