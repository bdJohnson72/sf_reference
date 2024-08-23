/**
 * Created by bjohnson on 3/26/24.
 */

public with sharing class Cars extends fflib_SObjects implements ComplianceService.ICompliant {

    public Cars(List<Car__c> cars){
        super(cars);
    }

    public List<Car__c> getCars(){
        return (List<Car__c>) getRecords();
    }

    public List<ComplianceService.VerifyResult> verifyCompliance(){
        List<ComplianceService.VerifyResult> compliances = new List<ComplianceService.VerifyResult>();
        for (Car__c car : getCars()){
            ComplianceService.VerifyResult license = new ComplianceService.VerifyResult();
            license.complianceCode = '4.1';
            license.recordId = car.Id;
            license.passed = car.Weight__c != null &&
                    car.Weight__c >= 691;
            license.failureReason = license.passed ? null :
            'Car must not be less than 691kg';
            compliances.add(license);
        }
        return compliances;
    }

    public class Constructor implements fflib_IDomainConstructor {
        public fflib_SObjects construct(List<Object> objectList){
            return new Cars((List<SObject>) objectList);
        }
    }

}