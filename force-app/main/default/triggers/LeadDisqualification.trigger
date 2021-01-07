trigger LeadDisqualification on Lead (before insert, before update) {

    // Variable to store the values used to disqalify a lead
    Set<String> keywords = new Set<String>();
    keywords.add('test');
    keywords.add('TEST');
    keywords.add('Test');
    system.debug(keywords);

    // Interate over the leads and find leads that has 'test' in its name
    for (Lead myLead : Trigger.new) {
        if(myLead.LastName != null && myLead.Company != null && myLead.Status != null) {
            for (String key : keywords) {
                if (myLead.FirstName.containsIgnoreCase(key) || myLead.LastName.containsIgnoreCase(key)) {
                    myLead.Status = 'Disqualified';
                }
            }
        }
    }
}

/**
 * String delimiter = '-';
String input = 'this-is-test-data';
String firstSplit = input.substringBefore(delimiter); // 'this'
String lastSplits = input.substringAfter(delimiter);
 */