/**
 * Created by bjohnson on 11/14/23.
 */

public with sharing class ContestantController {

    @AuraEnabled
    public static void awardPoints(Id contestantId){
        try {
            ContestantService.awardChampionshipPoints(new Set<Id>{contestantId});
        } catch (Exception e) {
            Logger.error('Error awarding points', e);
            Logger.saveLog(Logger.SaveMethod.EVENT_BUS);
            FormulaForceApplication.throwAuraHandledException(e);
        }
    }


}