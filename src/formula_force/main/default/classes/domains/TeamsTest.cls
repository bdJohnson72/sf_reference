/**
 * Created by bjohnson on 3/26/24.
 */

@IsTest
private class TeamsTest {
    @IsTest
    static void itShouldVerifyTeamCompliance() {
        //given
        Team__c team1 = new Team__c(Id = fflib_IDGenerator.generate(Team__c.SObjectType),Testing_Distance__c = 1000);
        Team__c team2 = new Team__c(Id = fflib_IDGenerator.generate(Team__c.SObjectType),Testing_Distance__c = 2000);
        //when
        List<ComplianceService.VerifyResult> results = new Teams(new List<Team__c>{team1, team2}).verifyCompliance();
        //then
        Assert.isTrue(results.size() == 2, 'It should return a result for both records');
        Assert.isTrue(results[0].recordId == team1.Id && results[0].passed, 'team1 should pass' );
        Assert.isFalse(results[1].passed, 'team2 should fail');
    }
}