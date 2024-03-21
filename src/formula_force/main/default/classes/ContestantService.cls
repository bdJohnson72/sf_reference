/**
 * Created by bjohnson on 11/18/23.
 */

public with sharing class ContestantService {

    public class contestantServiceException extends Exception{}
    public static void awardChampionshipPoints(Set<Id> contestantIds){
        fflib_ISObjectUnitOfWork uow = FormulaForceApplication.UnitOfWork.newInstance();
        awardChampionshipPoints(uow, FormulaForceApplication.Selector.selectById(contestantIds));
        uow.commitWork();
    }
    public static void awardChampionshipPoints(fflib_ISObjectUnitOfWork uow, List<Contestant__c> contestants){
        ChampionshipPointsSelector championshipPointsSelector =  (ChampionshipPointsSelector) FormulaForceApplication.Selector.newInstance(
                Championship_Points__mdt.SObjectType
        );
        Map<Integer, Championship_Points__mdt> pointsByTrackPosition = championshipPointsSelector.pointsByTrackPosition();
        for(Contestant__c contestant : contestants){
            Championship_Points__mdt points = pointsByTrackPosition.get(Integer.valueOf(contestant.RacePosition__c));
            if (points != null) {
                contestant.ChampionshipPoints__c = points.PointsAwarded__c;
            }
            uow.registerDirty(contestant);
        }
    }
    public static void retireFromRace(List<RaceRetirement> raceRetirements){
       throw new contestantServiceException('Not implemented');
    }
    public class RaceRetirement {
        public Id contestantId;
        public String reason;
    }
}