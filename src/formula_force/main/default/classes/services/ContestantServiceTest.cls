/**
 * Created by bjohnson on 11/18/23.
 */

@IsTest
private class ContestantServiceTest {

    @IsTest
    static void itShouldAwardPoints() {
        //given
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        fflib_ISObjectUnitOfWork mockUOW = (fflib_ISObjectUnitOfWork) mocks.mock(fflib_ISObjectUnitOfWork.class);
        ContestantsSelector mockSelector =  (ContestantsSelector)mocks.mock(ContestantsSelector.class);
        Contestant__c mockContestant = new Contestant__c(ID = fflib_IDGenerator.generate(Contestant__c.SObjectType)
                , RacePosition__c = 1);

        mocks.startStubbing();
        mocks.when(mockSelector.sObjectType()).thenReturn(Contestant__c.SObjectType);
        mocks.when(mockSelector.selectSObjectsById(new Set<Id>{mockContestant.Id}))
                .thenReturn(new List<Contestant__c>{mockContestant });
        mocks.stopStubbing();
        FormulaForceApplication.UnitOfWork.setMock(mockUOW);
        FormulaForceApplication.Selector.setMock(mockSelector);
        //when
        ContestantService.awardChampionshipPoints(new Set<Id>{mockContestant.Id});
        //then
        ((fflib_ISObjectUnitOfWork)mocks.verify(mockUOW, 1)).commitWork();
        ((fflib_ISObjectUnitOfWork)mocks.verify(mockUOW, 1)).registerDirty(
                fflib_Match.sObjectWith(new Map<SObjectField, Object>{
                        Contestant__c.Id => mockContestant.Id,
                        Contestant__c.RacePosition__c => 1,
                        Contestant__c.ChampionshipPoints__c => 25
                })
        );
    }
}