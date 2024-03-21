/**
 * Created by bjohnson on 11/18/23.
 */

global with sharing class SeasonNewsLetterScheduler implements Schedulable{

    global void execute(SchedulableContext sc) {
        try {
            SeasonService.issueNewsLetters(null);
        } catch (Exception e) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(UserInfo.getUserId());
            mail.setSenderDisplayName(UserInfo.getName());
            mail.setSubject('Failed to send newsletter');
            mail.setHtmlBody(e.getMessage());
            mail.setSaveAsActivity(false);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
    }
}