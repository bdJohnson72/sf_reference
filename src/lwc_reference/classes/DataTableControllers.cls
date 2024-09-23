/**
 * Created by bjohnson on 2/11/24.
 */

public with sharing class DataTableControllers {

    @AuraEnabled
    public static List<Contact> getContacts(){
        return [SELECT Name, Email, Phone,
                Account.Name, MailingCity, MailingAddress,
                MailingPostalCode, MailingCountry
        FROM Contact
        WITH SYSTEM_MODE
        ORDER BY Name ASC
        ];

    }

}