/**
 * Created by bjohnson on 1/2/24.
 */

public with sharing class Drivers extends fflib_SObjects{

    public Drivers(List<Driver__c> drivers){
        super(drivers, Driver__c.SObjectType);
    }

    public List<Driver__c> getDrivers(){
        return (List<Driver__c>)getRecords();
    }

    public void validate(){
        for(Driver__c driver : getDrivers()){
            if(String.isBlank(driver.ShortName__c)){
                String lastName = driver.Name.substringAfterLast(' ');
                driver.ShortName__c = lastName.left(3).toUpperCase();
            }
        }
    }

    public class Constructor implements fflib_IDomainConstructor{
        public fflib_SObjects construct(List<Object> objectList){
            return new Drivers((List<SObject>) objectList);
        }
    }


}