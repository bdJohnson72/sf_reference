/**
 * Created by brooksjohnson on 3/29/24.
 */

trigger JobApplication on JobApplication__c (before insert, before update, before delete, after insert,
        after update, after delete, after undelete) {

    fflib_SObjectDomain.triggerHandler(JobApplicationsHandler.class);

}