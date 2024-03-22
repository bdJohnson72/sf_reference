/**
 * Created by bjohnson on 11/18/23.
 */

@IsTest
private class RaceServiceTest {
    @IsTest
    static void itShouldAwardPoints() {
        //given
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        fflib_ISObjectUnitOfWork mockUOW = (fflib_ISObjectUnitOfWork)mocks.mock(fflib_ISObjectUnitOfWork.class);
        RacesSelector mockSelector = (RacesSelector) mocks.mock(RacesSelector.class);
        Race__c mockRace = new Race__c(Id = fflib_IDGenerator.generate(Race__c.SObjectType));
        Contestant__c mockContestant = new Contestant__c(Id = fflib_IDGenerator.generate(Contestant__c.SObjectType),
                RacePosition__c = 1);
        List<Race__c> racesWithContestantsMock = (List<Race__c>) fflib_ApexMocksUtils.makeRelationship(
                List<Race__c>.class,
                new List<Race__c>{mockRace},
                Contestant__c.Race__c,
                new List<List<Contestant__c>>{new List<Contestant__c>{mockContestant}}
        );
        mocks.startStubbing();
        mocks.when(mockSelector.sObjectType()).thenReturn(Race__c.SObjectType);
        mocks.when(mockSelector.selectByIdWithContestants(new Set<Id>{mockRace.Id})).thenReturn(racesWithContestantsMock);
        mocks.stopStubbing();
        FormulaForceApplication.Selector.setMock(mockSelector);
        FormulaForceApplication.UnitOfWork.setMock(mockUOW);
        //when
        RaceService.awardChampionshipPoints(new Set<Id>{mockRace.Id});
        //then
        ((fflib_ISObjectUnitOfWork)mocks.verify(mockUOW, 1)).commitWork();
        ((fflib_ISobjectUnitOfWork)mocks.verify(mockUOW, 1)).registerDirty(fflib_Match.sObjectWith(
                new Map<SObjectField, Object>{
                        Contestant__c.Id  => mockContestant.Id,
                        Contestant__c.RacePosition__c => 1,
                       Contestant__c.ChampionshipPoints__c => 25
                }
        ));

    }
}