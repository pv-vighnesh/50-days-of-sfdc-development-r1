trigger CheckSecretInformation on Case (after insert, before update) {
    String childCaseSubject = 'Warning: Parent case may contain Secret Information';
    
    // Create a collection that contains all the secret keywords
    Set<String> secretKeyWords = new Set<String>();
    secretKeyWords.add('Credit Card');
    secretKeyWords.add('Social Security');
    secretKeyWords.add('SSN');
    secretKeyWords.add('Passport');

    // Loop through all the cases to find if any of the case description 'contains' secret keyword
    List<Case> caseWithSecretInfo = new List<Case>();
    for (Case myCase : Trigger.new) {
        if (myCase.Subject != childCaseSubject) {
            for (String keyword : secretKeyWords) {
                if (myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)) {
                    caseWithSecretInfo.add(myCase);
                    break;
                }
            }
        }
    }

    // If Secret keyword is found, create a child case, Escalate and set the priority to High
    for (Case caseWithKeyword : caseWithSecretInfo) {
        Case childCase         = new Case();
        childCase.Subject      = childCaseSubject;
        childCase.ParentId     = caseWithSecretInfo.get(0).id;
        childCase.IsEscalated  = true;
        childCase.Priority     = 'High';
        childCase.Description  = 'Atleast one of the following keywords were found ' + secretKeyWords;
        insert childCase;
    }
}