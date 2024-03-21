/**
 * Created by bjohnson on 1/2/24.
 */

public with sharing class DriverTriggerHandler extends ApplicationDomain{

    public DriverTriggerHandler(List<Driver__c> drivers){
        super(drivers);
    }

    public override void onApplyDefaults(){
        new Drivers(Records).validate();
    }

    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> objList) {
            return new DriverTriggerHandler(objList);
        }
    }

}