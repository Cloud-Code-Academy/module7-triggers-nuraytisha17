public with sharing class AccountTriggerHelper {

    // Q1:  When an account is inserted change the account type to 'Prospect' if there is no value in the type field
    public static void accountTypeProspect(List<Account> triggerNew) {

        for (Account acc : triggerNew) 
        {
            if (String.isBlank(acc.Type)) 
            {
                acc.Type = 'Prospect';
            }
        }
    }

    // Q2: When an account is inserted copy the shipping address to the billing address, also check if any of the shipping address fields are blank
    public static void copyShippingToBilling(List<Account> triggerNew) {

        for (Account acc : triggerNew) 
        {
            if (String.isNotBlank(acc.ShippingStreet) ||
                String.isNotBlank(acc.ShippingCity) ||
                String.isNotBlank(acc.ShippingState) ||
                String.isNotBlank(acc.ShippingPostalCode) ||
                String.isNotBlank(acc.ShippingCountry)) 
            {
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingState = acc.ShippingState;
                acc.BillingPostalCode = acc.ShippingPostalCode;
                acc.BillingCountry = acc.ShippingCountry;
            }
        }
    }

    //Q3: When an account is inserted set the rating to 'Hot' if the Phone, Website, and Fax ALL have a value
    public static void setRatingToHot (List<Account> triggerNew) {

        for (Account acc : triggerNew) 
        {
            if (acc.Phone != null &&
                acc.Website != null &&
                acc.Fax != null) 
            {
                acc.Rating = 'Hot';
            }
        }
    }

    // Q4: When an account is inserted create a contact related to the account with the given default values
    public static void createContact (List<Account> triggerNew) {

    List<Contact> contactsToInsert = new List<Contact>();

        for (Account acc : triggerNew) 
        {
            contactsToInsert.add(new Contact(
                AccountId = acc.Id,
                LastName = 'DefaultContact',
                Email = 'default@email.com'
            ));
        }

        if (!contactsToInsert.isEmpty()) {
            insert contactsToInsert;
        }
    }
}