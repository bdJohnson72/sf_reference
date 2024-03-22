/**
 * Created by bjohnson on 3/22/24.
 */

trigger Races on Race__c (before insert, before update, before delete, after insert,
        after update, after delete, after undelete) {

    fflib_SObjectDomain.triggerHandler(RacesTriggerHandler.class);

}