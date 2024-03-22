/**
 * Created by bjohnson on 3/25/24.
 */

public with sharing class Contestants extends fflib_SObjects {

    public Contestants(List<Contestant__c> contestants) {
        super(contestants, Contestant__c.SObjectType);
    }

    public void validate() {
        validateRaceIsScheduled();
    }


    private void validateRaceIsScheduled() {
        Set<Id> raceIds = getIdFieldValues(Contestant__c.Race__c);
        RacesSelector selector = (RacesSelector) FormulaForceApplication.Selector.newInstance(Race__c.SObjectType);
        Map<Id, Race__c> racesById = new Map<Id, Race__c>((List<Race__c>)selector.selectById(raceIds));
        for (Contestant__c contestant : (List<Contestant__c>) getRecords()) {
            Race__c relatedRace = racesById.get(contestant.Race__c);
            if (relatedRace.Status__c != 'Scheduled') {
                contestant.addError('Contestant must be added to a scheduled race');
            }
        }
    }

    public class Constructor implements fflib_IDomainConstructor{
        public fflib_SObjects construct(List<Object> objects){
            return new Contestants((List<SObject>) objects);
        }
    }
}