/**
 * Created by bjohnson on 11/26/23.
 */

public interface IRaceService {

    Map<Id, List<RaceServiceResults.ProvisionalResult>> calculateProvisionalResults(Set<Id> raceIds);

    void applyRaceResults(Map<Id,List<RaceServiceResults.ProvisionalResult>> provisionalResultsByRaceId);

    void awardChampionshipPoints(Set<Id> raceIds);

}