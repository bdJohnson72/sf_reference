/**
 * Created by bjohnson on 1/2/24.
 */

public with sharing class Drivers extends fflib_SObjects implements ComplianceService.ICompliant {

    public Drivers(List<Driver__c> drivers){
        super(drivers, Driver__c.SObjectType);
    }

    public List<Driver__c> getDrivers(){
        return (List<Driver__c>)getRecords();
    }


    public void applyDefaults(){
        setShortName();
    }

    private void setShortName(){
        for(Driver__c driver : getDrivers()){
            if(String.isBlank(driver.ShortName__c)){
                String lastName = driver.Name.substringAfterLast(' ');
                driver.ShortName__c = lastName.left(3).toUpperCase();
            }
        }
    }

    public List<ComplianceService.VerifyResult> verifyCompliance(){
        List<ComplianceService.VerifyResult> compliances = new List<ComplianceService.VerifyResult>();
        for(Driver__c driver: getDrivers()){
            ComplianceService.VerifyResult license = new ComplianceService.VerifyResult();
            license.complianceCode = '4.1';
            license.recordId = driver.Id;
            license.passed = driver.FIA_Super_License__c;
            license.failureReason  = license.passed ? null :
            'Driver must have a FIA super license';
            compliances.add(license);
        }
        return compliances;
    }

    public class Constructor implements fflib_IDomainConstructor{
        public fflib_SObjects construct(List<Object> objectList){
            return new Drivers((List<SObject>) objectList);
        }
    }


}