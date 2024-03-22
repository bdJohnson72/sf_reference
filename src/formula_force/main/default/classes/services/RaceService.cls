/**
 * Created by bjohnson on 11/18/23.
 */

public with sharing class RaceService {

    public class RaceServiceException extends Exception{}

    public static Map<Id, List<RaceServiceResults.ProvisionalResult>> calculateProvisionalResults(Set<Id>raceIds){
        return service().calculateProvisionalResults(raceIds);
    }
    public static void applyRaceResults(Map<Id, List<RaceServiceResults.ProvisionalResult>>
    provisionalResultsByRaceId){
        service().applyRaceResults(provisionalResultsByRaceId);
    }
    public static void awardChampionshipPoints(Set<Id>raceIds){
        service().awardChampionshipPoints(raceIds);
    }
    public static IRaceService service(){
        return (IRaceService) FormulaForceApplication.Service.newInstance(IRaceService.class);
    }

}