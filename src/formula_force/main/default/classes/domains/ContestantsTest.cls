/**
 * Created by bjohnson on 3/26/24.
 */

@IsTest
private class ContestantsTest {
    @IsTest
    static void itShouldAddError() {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Race__c race1 = new Race__c(Id = fflib_IDGenerator.generate(Race__c.SObjectType), Status__c = 'Active');
        Race__c race2 = new Race__c(Id = fflib_IDGenerator.generate(Race__c.SObjectType), Status__c = 'Scheduled');
        Contestant__c contestantGood = new Contestant__c( Race__c = race2.Id );
        Contestant__c contestantBad = new Contestant__c( Race__c = race1.Id );
        RacesSelector mockSelector = (RacesSelector) mocks.mock(RacesSelector.class);
        mocks.startStubbing();
        mocks.when(mockSelector.selectById(new Set<Id>{race2.Id, race1.Id}))
                .thenReturn(new List<Race__c>{race1, race2});
        mocks.when(mockSelector.sObjectType()).thenReturn(Race__c.SObjectType);
        mocks.stopStubbing();
        FormulaForceApplication.Selector.setMock(mockSelector);
        //when
        Contestants contestants = new Contestants(new List<Contestant__c>{contestantBad, contestantGood});
        contestants.validate();
        Assert.isTrue(contestantBad.hasErrors(), 'Should have error added');
        Assert.isFalse(contestantGood.hasErrors(), 'Should not have error added');
    }

    @IsTest
    static void itShouldAwardPoints(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();

        // Given
        fflib_SObjectUnitOfWork mockUow = (fflib_SObjectUnitOfWork) mocks.mock(fflib_SObjectUnitOfWork.class);
        FormulaForceApplication.UnitOfWork.setMock(mockUow);
        Id testContestantId = fflib_IDGenerator.generate(Contestant__c.SObjectType);
        List<Contestant__c> testContestants =
                new List<Contestant__c> {
                        new Contestant__c (
                                Id = testContestantId,
                                RacePosition__c = 1 )
                };


        // When
         new Contestants(testContestants).awardChampionshipPoints(mockUow);

        // Then
        ((fflib_SObjectUnitOfWork)
                mocks.verify(mockUow, 1)).registerDirty(
                fflib_Match.sObjectWith(
                        new Map<SObjectField, Object>{
                                Contestant__c.Id => testContestantId,
                                Contestant__c.RacePosition__c => 1,
                                Contestant__c.ChampionshipPoints__c => 25}
                        ));
    }


    @IsTest
    static void itShouldAddErrorsOnChangeIntegration(){
        //given
        Season__c season = new Season__c(Name = '2024');
        insert season;
        Race__c race = new Race__c(Name ='Cool Race', Season__c = season.Id);
        insert race;
        Driver__c driver1 = new Driver__c(Name = 'Test Driver 1', DriverId__c = '123');
        Driver__c driver2 = new Driver__c(Name = 'Test Driver 2', DriverId__c = '456');
        insert new List<Driver__c>{driver2, driver1};
        Contestant__c contestant1 = new Contestant__c(Race__c = race.Id, Driver__c = driver1.Id);
        Contestant__c contestant2 = new Contestant__c(Race__c = race.Id, Driver__c = driver2.Id);
        insert  new List<Contestant__c>{contestant1, contestant2};
        race.Status__c = 'Red Flagged';
        update race;
        contestant1.Driver__c = driver2.Id;
        try {
            update new List<Contestant__c>{contestant2, contestant1};
            Assert.fail('should not reach this line');
        }catch (Exception e){
            System.debug('e=' + e.getMessage());
            Assert.isTrue(e.getMessage().contains('Contestant must be added to a scheduled race'));
        }
    }
}