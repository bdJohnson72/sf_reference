/**
 * Created by bjohnson on 11/18/23.
 */

public with sharing class SeasonController {

    public static void sendNewsLetter(){
        try {
            SeasonService.issueNewsLetters(null);
        } catch (Exception e) {
            Logger.error('Error sending newsletter', e);
            Logger.saveLog(Logger.SaveMethod.EVENT_BUS);
            FormulaForceApplication.throwAuraHandledException(e);
        }
    }
}