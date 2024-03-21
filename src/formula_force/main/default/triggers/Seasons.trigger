/**
 * Created by bjohnson on 12/30/23.
 */

trigger Seasons on Season__c (before insert, before update, before delete, after insert,
        after update, after delete, after undelete) {

    fflib_SObjectDomain.triggerHandler(SeasonsTriggerHandler.class);

}