trigger AccountTrigger on Account (before insert, after insert) {

    if (Trigger.isBefore && Trigger.isInsert)
    {
        // Question 1
        AccountTriggerHelper.accountTypeProspect(Trigger.new);

        // Question 2
        AccountTriggerHelper.copyShippingToBilling(Trigger.new);

        // Question 3
        AccountTriggerHelper.setRatingToHot(Trigger.new);
    }
        
    if (Trigger.isAfter && Trigger.isInsert)
    {
        // Question 4
        AccountTriggerHelper.createContact(Trigger.new);
    }

}
