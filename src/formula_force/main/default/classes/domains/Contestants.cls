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

    public List<Contestant__c> getContestants(){
        return (List<Contestant__c>) getRecords();
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

    public void awardChampionshipPoints(fflib_ISObjectUnitOfWork uow){
        Map<Integer, Championship_Points__mdt> pointsByTrackPosition =
                new ChampionshipPointsSelector().pointsByTrackPosition();
        for(Contestant__c contestant : getContestants()){
            Championship_Points__mdt points = pointsByTrackPosition.get(Integer.valueOf(contestant.RacePosition__c));
            if (points != null ) {
               contestant.ChampionshipPoints__c = points.PointsAwarded__c;
                uow.registerDirty(contestant);
            }
        }
    }

    public class Constructor implements fflib_IDomainConstructor{
        public fflib_SObjects construct(List<Object> objects){
            return new Contestants((List<SObject>) objects);
        }
    }
}