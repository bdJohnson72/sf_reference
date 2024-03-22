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
            System.debug('e = ' +   e.getMessage());
          //  System.debug('fields ' + e.getInaccessibleFields());
            System.debug(e.getStackTraceString());
            FormulaForceApplication.throwAuraHandledException(e);
        }
    }


}