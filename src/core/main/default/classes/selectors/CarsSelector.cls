/**
 * Created by bjohnson on 3/26/24.
 */

public inherited sharing class CarsSelector extends ApplicationSelector {

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
                Car__c.Name,
                Car__c.Id,
                Car__c.Manufacturer__c,
                Car__c.MSRP__c,
                Car__c.Description__c,
                Car__c.Weight__c
        };
    }
    public SObjectType getSObjectType(){
        return Car__c.SObjectType;
    }

    public List<Car__c> selectById(Set<Id> carIds){
        return selectSObjectsById(carIds);
    }

}