/**
 * Created by bjohnson on 12/30/23.
 */

public with sharing class RacesTriggerHandler extends ApplicationDomain{

    public RacesTriggerHandler(List<Race__c> races){
        super(races);
    }

    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sobjectList){
            return new RacesTriggerHandler(sobjectList);
        }
    }
}