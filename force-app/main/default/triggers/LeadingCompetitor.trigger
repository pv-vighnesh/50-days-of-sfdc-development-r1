trigger LeadingCompetitor on Opportunity (before insert, before update) {
    
    for (Opportunity opp : Trigger.new) {
        // List to store Competitor Prices in order
        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(opp.Competitor_1_Price__c);
        competitorPrices.add(opp.Competitor_2_Price__c);
        competitorPrices.add(opp.Competitor_3_Price__c);

        // List to store Names of the competitors, should be in same order as above
        List<String> competitorNames = new List<String>();
        competitorNames.add(opp.Competitor_1__c);
        competitorNames.add(opp.Competitor_2__c);
        competitorNames.add(opp.Competitor_3__c);

        // Looping through the Competitor prices to find out the lowest price
        Decimal lowestPrice;
        Integer lowestPricePosition;
        for (Integer i = 0; i < competitorPrices.size(); i++) {
            Decimal currentPrice = competitorPrices.get(i);
            if (lowestPrice == null || currentPrice < lowestPrice) {
                lowestPrice = currentPrice;
                lowestPricePosition = i;
            }
        }

        // Looping through the Competitor prices to find out the highest price
        Decimal highestPrice;
        Integer highestPricePosition;
        for (Integer i = 0; i < competitorPrices.size(); i++) {
            Decimal currentPrice = competitorPrices.get(i);
            if (highestPrice == null || currentPrice > highestPrice) {
                highestPrice = currentPrice;
                highestPricePosition = i;
            }
        }

        // Populating the leading competitor field
        opp.Leading_Competitor__c = competitorNames.get(lowestPricePosition);
        opp.Leading_Competitor_Price__c = competitorPrices.get(lowestPricePosition);

        // Populating the most expensive competitor field
        opp.Most_Expensive_Competitor__c = competitorNames.get(highestPricePosition);
        opp.Expensive_Competitor_Price__c = competitorPrices.get(highestPricePosition);
    }
}


/*
trigger LeadingCompetitor on Opportunity (before insert, before update) {

    for (Opportunity opp : Trigger.new) {

        // List to store Prices
        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(Competitor_1_Price__c);
        competitorPrices.add(Competitor_2_Price__c);
        competitorPrices.add(Competitor_3_Price__c);

        //List to store Names
        List<String> competitorNames = new List<String>();
        competitorNames.add(Competitor_1__c);
        competitorNames.add(Competitor_2__c);
        competitorNames.add(Competitor_3__c);

        // Loop to find lowest Price
        Decimal lowestPrice;
        Integer lowestPricePosition;
        for (Integer i = 0; i < competitorPrices.size(); i++) {
            currentPrice = competitorPrices.get(i);

            if (lowestPrice == null || currentPrice < lowestPrice) {
                lowestPrice = currentPrice;
                lowestPricePosition = i;
            }
        }

        // getting competitor name with lowest price
        opp.Leading_Competitor__c = competitorNames.get(lowestPricePosition);
    }
}
*/