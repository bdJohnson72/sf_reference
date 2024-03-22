/**
 * Created by bjohnson on 3/22/24.
 */

public with sharing class DriversTriggerHandler extends ApplicationDomain {

    public DriversTriggerHandler(List<Driver__c> drivers) {
        super(drivers);
    }

    public override void onApplyDefaults() {
        new Drivers(Trigger.new).applyDefaults();
    }


    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new DriversTriggerHandler((List<Driver__c>) sObjectList);
        }
    }

}