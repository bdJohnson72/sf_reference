/**
 * Created by brooksjohnson on 5/1/24.
 */

public with sharing class LwcRefController {

    @AuraEnabled(Cacheable = true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name, Description,
                    BillingStreet, BillingCountry, BillingState,
                    BillingPostalCode
            FROM Account
            WITH SYSTEM_MODE
            ORDER BY Name
            LIMIT 10];
        } catch (Exception e) {
            Logger.error(e.getMessage());
            Logger.error(e.getStackTraceString());
            Logger.saveLog();
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts(){
        try {
            return [SELECT Id, Title, Email, Name
            FROM Contact
            WITH SYSTEM_MODE
            LIMIT 20];
        } catch (Exception e) {
            Logger.error(e.getMessage());
            Logger.error(e.getStackTraceString());
            Logger.saveLog();
            throw new AuraHandledException(e.getMessage());
        }
    }

}