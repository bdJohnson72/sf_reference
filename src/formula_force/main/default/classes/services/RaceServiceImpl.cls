/**
 * Created by bjohnson on 12/1/23.
 */

public with sharing class RaceServiceImpl implements IRaceService {

    public Map<Id, List<RaceServiceResults.ProvisionalResult>> calculateProvisionalResults(Set<Id> raceIds){
        throw new RaceService.RaceServiceException('Not Implemented');
    }

    public void applyRaceResults(Map<Id, List<RaceServiceResults.ProvisionalResult>> provisionalResultsByRaceId) {
        throw new RaceService.RaceServiceException('Not Implemented');
    }

    public void awardChampionshipPoints(Set<Id> raceIds) {
        fflib_ISObjectUnitOfWork uow = FormulaForceApplication.UnitOfWork.newInstance();
       RacesSelector racesSelector = (RacesSelector)FormulaForceApplication.Selector.newInstance(Race__c.SObjectType);
        List<Contestant__c> contestants = new List<Contestant__c>();
        for (Race__c race : racesSelector.selectByIdWithContestants(raceIds)){
            contestants.addAll(race.Contestants__r);
        }
        //delegate to Contestant Service
        ContestantService.awardChampionshipPoints(uow, contestants);
        uow.commitWork();
    }
}