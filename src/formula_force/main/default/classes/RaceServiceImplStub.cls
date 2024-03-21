/**
 * Created by bjohnson on 11/26/23.
 */

public inherited sharing class RaceServiceImplStub implements IRaceService {
    public Map<Id, List<RaceServiceResults.ProvisionalResult>> calculateProvisionalResults(Set<Id> raceIds) {
        Id raceId = new List<Id>(raceIds)[0];
        RaceServiceResults.ProvisionalResult hamilton = new RaceServiceResults.ProvisionalResult();
        hamilton.racePosition = 1;
        hamilton.contestantName = 'Lewis Hamilton';
        hamilton.contestantId = 'a0353000002f6MPAAY';
        RaceServiceResults.ProvisionalResult rubens = new RaceServiceResults.ProvisionalResult();
        rubens.contestantId = 'a0353000002f6MPAAY';
        rubens.contestantName = 'Ruebens Barichello';
        return null;
    }

    public void applyRaceResults(Map<Id, List<RaceServiceResults.ProvisionalResult>> provisionalResultsByRaceId) {
        throw new RaceService.RaceServiceException('Not implemented');
    }

    public void awardChampionshipPoints(Set<Id> raceIds) {
        throw new RaceService.RaceServiceException('Not implemented');
    }
}