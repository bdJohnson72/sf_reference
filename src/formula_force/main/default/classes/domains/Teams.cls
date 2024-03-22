/**
 * Created by bjohnson on 3/26/24.
 */

public with sharing class Teams extends fflib_SObjects implements ComplianceService.ICompliant{

    public Teams(List<Team__c> teams){
        super(teams);
    }

   public List<Team__c> getTeams(){
       return (List<Team__c>)getRecords();
   }

    public List<ComplianceService.VerifyResult> verifyCompliance(){
        List<ComplianceService.VerifyResult> verifyResults = new List<ComplianceService.VerifyResult>();
        for(Team__c team : getTeams()){
            ComplianceService.VerifyResult result = new ComplianceService.VerifyResult();
            result.recordId = team.Id;
            result.complianceCode = '22.5';
            result.passed = team.Testing_Distance__c != null ? team.Testing_Distance__c <= 1500 :
            true;
            result.failureReason = result.passed ? null : 'Testing Distance exceeded 1500 km';
            verifyResults.add(result);
        }
        DriversSelector selector = (DriversSelector)FormulaForceApplication.Selector.newInstance(Driver__c.SObjectType);
        verifyResults.addAll(new Drivers(selector.selectDriversBytTeam(new Map<Id, Team__c>(getTeams()).keySet()))
                .verifyCompliance());
        return verifyResults;
    }

    public class Constructor implements fflib_IDomainConstructor{

        public fflib_SObjects construct(List<Object> objects){
            return new Teams((List<SObject>)objects);
        }
    }

}