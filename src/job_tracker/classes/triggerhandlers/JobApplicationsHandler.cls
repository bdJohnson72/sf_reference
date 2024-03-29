/**
 * Created by brooksjohnson on 3/29/24.
 */

public with sharing class JobApplicationsHandler extends ApplicationDomain {

    public JobApplicationsHandler(List<JobApplication__c> jobApplications) {
        super(jobApplications);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new JobApplicationsHandler((List<JobApplication__c>) sObjectList);
        }
    }

}