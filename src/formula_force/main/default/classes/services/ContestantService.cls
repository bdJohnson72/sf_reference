/**
 * Created by bjohnson on 11/18/23.
 */

public inherited sharing class ContestantService {

    public class contestantServiceException extends Exception{}
    public static void awardChampionshipPoints(Set<Id> contestantIds){
        fflib_ISObjectUnitOfWork uow = FormulaForceApplication.UnitOfWork.newInstance(AccessLevel.SYSTEM_MODE);
        Contestants contestants = (Contestants) FormulaForceApplication.Domain.newInstance(contestantIds);
        contestants.awardChampionshipPoints(uow);
        uow.commitWork();
    }

    public static void retireFromRace(List<RaceRetirement> raceRetirements){
       throw new contestantServiceException('Not implemented');
    }
    public class RaceRetirement {
        public Id contestantId;
        public String reason;
    }
}