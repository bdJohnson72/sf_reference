/**
 * Created by bjohnson on 3/22/24.
 */

trigger Contestants on Contestant__c (before insert, before update, before delete,
        after insert, after update, after delete, after undelete) {

    fflib_SObjectDomain.triggerHandler(ContestantsTriggerHandler.class);

}