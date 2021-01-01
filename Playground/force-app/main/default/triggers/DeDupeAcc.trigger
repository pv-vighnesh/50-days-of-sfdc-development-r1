trigger DeDupeAcc on Account (after insert) {
    for (Account acc : Trigger.new) {
        Case c 		= new Case();
        c.OwnerId   = '0052w000008IPSmAAO';
        c.Subject   = 'Dedupe this account';
        c.AccountId	= acc.Id; 
        insert c;
    }
}