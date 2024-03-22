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
        new Drivers(new List<Driver__c>{testDriver, driver2}).validate();
        //then
        Assert.isTrue(testDriver.ShortName__c == 'DRI', 'Short name should be DRI');
    }
}