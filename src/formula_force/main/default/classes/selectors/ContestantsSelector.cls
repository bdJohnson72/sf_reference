/**
 * Created by bjohnson on 11/18/23.
 */

public inherited sharing class ContestantsSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList(){
       return new List<Schema.SObjectField>{
               Contestant__c.Name,
               Contestant__c.Id,
               Contestant__c.DNF__c,
               Contestant__c.Driver__c,
               Contestant__c.Race__c,
               Contestant__c.Qualification_Lap_Time_1__c,
               Contestant__c.Qualification_Lap_Time_2__c,
               Contestant__c.Qualification_Lap_Time_3__c,
               Contestant__c.DriverandRace__c,
               Contestant__c.RacePosition__c
       };
    }


    public SObjectType getSObjectType() {
        return Contestant__c.SObjectType;
    }

    public List<Contestant__c> selectById(Set<Id> ids) {
        return (List<Contestant__c>) super.selectSObjectsById(ids);
    }
}