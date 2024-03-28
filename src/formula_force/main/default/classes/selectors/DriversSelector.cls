/**
 * Created by bjohnson on 3/26/24.
 */

public inherited sharing class DriversSelector extends ApplicationSelector {

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
                Driver__c.Id,
                Driver__c.Name,
                Driver__c.FIA_Super_License__c
        };
    }

    public Schema.SObjectType getSObjectType(){
        return Driver__c.SObjectType;
    }

    public List<Driver__c> selectById(Set<Id> driverIds ){
        return (List<Driver__c>) selectSObjectsById(driverIds);
    }

    public List<Driver__c> selectDriversBytTeam(Set<Id> teamIds){
        return Database.query(newQueryFactory()
                .setCondition('Team__c In : teamIds')
                .toSOQL());
    }

}