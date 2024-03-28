/**
 * Created by bjohnson on 11/17/23.
 */

@IsTest
public with sharing class ContestantControllerTest {

    @IsTest
    static void testAwardPoints(){
        //given
        Season__c testSeason = new Season__c();
        insert testSeason;
        Driver__c testDriver = new Driver__c(Name ='Test Driver', DriverId__c = '44');
        insert testDriver;
        Race__c testRace = new Race__c(Name = 'test', Season__c = testSeason.Id);
        insert testRace;
        Contestant__c testContestant = new Contestant__c( Driver__c = testDriver.Id, Race__c = testRace.Id, RacePosition__c = 1);
        insert testContestant;
        //when
        ContestantController.awardPoints(testContestant.Id);
        //then
        Contestant__c updatedContestant = [SELECT Id, ChampionshipPoints__c
        FROM Contestant__c
        WHERE Id =: testContestant.Id];

        Assert.isTrue(updatedContestant.ChampionshipPoints__c == 25, 'It should update the points');
    }

    @IsTest
    static void  itShouldHandleException(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        ContestantService serviceMock = (ContestantService)mocks.mock(ContestantService.class);
        fflib_ISObjectUnitOfWork uowMock = (fflib_ISObjectUnitOfWork)mocks.mock(fflib_ISObjectUnitOfWork.class);
        mocks.startStubbing();
        ((fflib_ISObjectUnitOfWork)mocks.doThrowWhen(new ContestantService.contestantServiceException(),uowMock)).commitWork();
        mocks.stopStubbing();
        FormulaForceApplication.UnitOfWork.setMock(uowMock);
        try {
           ContestantController.awardPoints(fflib_IDGenerator.generate(Contestant__c.SObjectType));
            Assert.fail();
        } catch (Exception e) {
            Assert.isTrue(e instanceof AuraHandledException);
        }

    }

    @IsTest
    static void retireFromRace(){
        try {
           ContestantService.retireFromRace(null);
            Assert.fail();
        } catch (Exception e) {
            Assert.isTrue('Not Implemented' == e.getMessage());
        }
    }

}