@isTest
public class DeDupeAccTest {
    @isTest
    static void createAccount() {
        Account acc = new Account();
        acc.Name    = 'TestAcc';
        insert acc;
    }
}