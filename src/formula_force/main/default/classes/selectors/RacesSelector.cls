/**
 * Created by bjohnson on 11/18/23.
 */

public inherited sharing class RacesSelector extends fflib_SObjectSelector {

    public List<SObjectField> getSObjectFieldList() {

        return new List<Schema.SObjectField>{
                Race__c.Id,
                Race__c.Name
        };
    }
    public SObjectType getSObjectType() {
        return Race__c.SObjectType;
    }

    public List<Race__c> selectByIdWithContestants(Set<Id> raceIds){
        fflib_QueryFactory raceQueryFactory = newQueryFactory();
        fflib_QueryFactory contestantsSubQueryFactory = new ContestantsSelector().addQueryFactorySubselect(raceQueryFactory);
        return (List<Race__c>) Database.query(raceQueryFactory.setCondition('Id in :raceIds').toSOQL());
    }

}