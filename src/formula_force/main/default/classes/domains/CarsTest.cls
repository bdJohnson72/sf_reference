/**
 * Created by bjohnson on 3/26/24.
 */

@IsTest
private class CarsTest {
    @IsTest
    static void itShouldVerifyCompliance() {
        //given
        Car__c car1 = new Car__c(Id = fflib_IDGenerator.generate(Car__c.SObjectType),
                Weight__c = 100);
        Car__c car2 = new Car__c(Id = fflib_IDGenerator.generate(Car__c.SObjectType), Weight__c = 800);
        //when
        List<ComplianceService.VerifyResult> complianceResults = new Cars(new List<Car__c>{car1, car2}).verifyCompliance();
        //then
        Assert.isTrue(complianceResults.size() == 2, 'It should return one result per car');
        Assert.isFalse(complianceResults[0].passed, 'Car 1 should fail');
        Assert.isTrue(complianceResults[1].passed, 'Car 2 should pass');
    }
}