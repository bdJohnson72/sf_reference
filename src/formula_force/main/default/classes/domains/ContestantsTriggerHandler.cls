/**
 * Created by bjohnson on 3/22/24.
 */

public with sharing class ContestantsTriggerHandler extends ApplicationDomain {

    public ContestantsTriggerHandler(List<Contestant__c> contestants) {
        super(contestants);
    }

    public override void onValidate() {
        new Contestants(Trigger.new).validate();
    }

    public override void onValidate(Map<Id, SObject> existingRecords) {
        new Contestants(getChangedRecords(new Set<String>{'Driver__c'})).validate();

    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new ContestantsTriggerHandler((List<Contestant__c>) sObjectList);
        }
    }

}