/**
 * Created by bjohnson on 12/30/23.
 */

public with sharing class SeasonsTriggerHandler extends ApplicationDomain {

    public SeasonsTriggerHandler(List<Season__c> seasons){
        super(seasons);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new SeasonsTriggerHandler((List<Season__c>) sObjectList);
        }
    }
}