trigger AppleWatch on Opportunity (after insert) {
    for (Opportunity opp : Trigger.new) {
        Task t        = new Task();
        t.Subject     = 'Apple watch Promo';
        t.Description = 'Send them one ASAP';
        t.Status      = 'In Progress';
        t.Priority    = 'High';
        t.WhatId      = opp.Id;
        insert t;
    }
}