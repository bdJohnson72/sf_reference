/**
 * Created by bjohnson on 3/4/24.
 */

public with sharing class CarsController {

    @AuraEnabled(Cacheable = true)
    public static List<Car__c> getCars(Filters filters){
        System.debug('filters=' + filters);
        try {
            String key = '';
            String whereClause = '';
            Decimal maxPrice;
            String[] categories, makeType, criteria = new List<String>();
            if(filters != null){
                if(filters.searchKey != null){
                    key = filters.searchKey;
                    criteria.add('Name LIKE \'%' + key + '%\'');
                }
                if(filters.maxPrice != null){
                    maxPrice = filters.maxPrice;
                    criteria.add('MSRP__c <= ' + maxPrice);
                }
                if(filters.categories != null && filters.categories.size() > 0){
                    categories = filters.categories;
                    whereClause += 'Category__c IN :categories';
                }
                if(filters.manufacturer != null && filters.manufacturer.size() > 0){
                    makeType = filters.manufacturer;
                    whereClause += 'Make_Type__c IN :makeType';
                }
                if (criteria.size() > 0) {
                    whereClause += ' WHERE ' + String.join(criteria, ' AND ');

                }
            }
            String query = 'SELECT Id, Name, MSRP__c, Category__c, Picture__c, Description__c, Manufacturer__c FROM Car__c'
                    + whereClause + ' ORDER BY Name';
            System.debug('query: ' + query);
            return Database.query(query, AccessLevel.USER_MODE);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class Filters {
        @AuraEnabled
        public String searchKey {get; set;}
        @AuraEnabled
        public Decimal maxPrice {get; set;}
        @AuraEnabled
        public String[] categories {get; set;}
        @AuraEnabled
        public String[] manufacturer {get; set;}
    }
}