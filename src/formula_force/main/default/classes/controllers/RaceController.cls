/**
 * Created by bjohnson on 11/17/23.
 */

public with sharing class RaceController {

    @AuraEnabled
    public static void awardPoints(Id raceId){
        try {
           RaceService.awardChampionshipPoints(new Set<Id>{raceId});
        } catch (Exception e) {
            FormulaForceApplication.throwAuraHandledException(e);
        }

    }
}