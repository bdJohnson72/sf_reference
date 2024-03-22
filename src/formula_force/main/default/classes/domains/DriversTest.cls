/**
 * Created by bjohnson on 1/2/24.
 */

@IsTest
private class DriversTest {
    @IsTest
    static void ItShouldUpdateShortName() {
        //given
        Driver__c testDriver = new Driver__c(Name = 'Cool Driver');
        Driver__c driver2 = new Driver__c(Name = 'Cool Driver');
        //when
        new Drivers(new List<Driver__c>{testDriver, driver2}).applyDefaults();
        //then
        Assert.isTrue(testDriver.ShortName__c == 'DRI', 'Short name should be DRI');
    }

    @IsTest
    static void itShouldVerifyCompliance(){
        //given
        Driver__c driver1 = new Driver__c(Id = fflib_IDGenerator.generate(Driver__c.SObjectType), FIA_Super_License__c = true);
        Driver__c driver2 = new Driver__c(Id = fflib_IDGenerator.generate(Driver__c.SObjectType), FIA_Super_License__c = false);
        //when
        List<ComplianceService.VerifyResult> results = new Drivers(new List<Driver__c>{driver1, driver2}).verifyCompliance();
        System.debug(results[1]);
        //then
        Assert.isTrue(results.size() == 2, 'It should return one compliance failure');
        Assert.isTrue(results[0].passed, 'Driver should pass with license');
        Assert.isFalse(results[1].passed, 'Driver should not pass with license');
        Assert.isTrue(results[1].recordId == driver2.Id, 'It should return the driver with no license');
    }
}