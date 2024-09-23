/**
 * Created by brooksjohnson on 4/22/24.
 */

public with sharing class NoteTakingController {

    @AuraEnabled
    public static Boolean createNoteRecord(String noteRecord){
        try {
            My_Note__c note = (My_Note__c) JSON.deserializeStrict(noteRecord, My_Note__c.class);
            if(!String.isBlank(note.Name)){
                insert note;
                return true;
            }
            return false;
        } catch (Exception e) {
            Logger.error(e.getMessage());
            Logger.saveLog();
            throw new AuraHandledException(e.getMessage());
        }
    }

}