/**
 * Created by brooksjohnson on 3/29/24.
 */

public  inherited sharing class JobApplicationsSelector extends ApplicationSelector {
    public SObjectType getSObjectType() {
        return JobApplication__c.SObjectType;
    }

    public List<SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
                JobApplication__c.Name,
                JobApplication__c.Id,
                JobApplication__c.Application_Date__c,
                JobApplication__c.Follow_Up_Date__c,
                JobApplication__c.Description__c,
                JobApplication__c.Company__c,
                JobApplication__c.Primary_Contact__c,
                JobApplication__c.Salary__c
        };
    }

    public List<JobApplication__c> selectByID(Set<Id> jobApplicationIDs ){
        return (List<JobApplication__c>) selectSObjectsById(jobApplicationIDs);
    }


}