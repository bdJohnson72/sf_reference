/**
 * Created by bjohnson on 11/26/23.
 */

public with sharing class RaceServiceResults {

    public class ProvisionalResult{
        public Integer racePosition {get; set;}
        public Id contestantId {get; set;}
        public String contestantName {get; set;}
    }
}