/**
 * Created by brooksjohnson on 3/29/24.
 */

public with sharing class JobApplications extends fflib_SObjects {

    public JobApplications(List<JobApplication__c> jobApplications){
        super(jobApplications, JobApplication__c.SObjectType);
    }

    public class Constructor implements fflib_IDomainConstructor{
        public fflib_SObjects construct(List<Object> objects){
            return new JobApplications((List<SObject>) objects);
        }
    }


}