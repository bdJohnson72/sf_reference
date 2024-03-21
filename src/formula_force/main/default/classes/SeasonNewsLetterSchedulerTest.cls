/**
 * Created by bjohnson on 11/18/23.
 */

@IsTest
private class SeasonNewsLetterSchedulerTest {

    @IsTest
    static void itShouldScheduleNewsLetter() {
        Test.startTest();
        System.schedule('News Letter Test', '0 0 0 3 9 ? 2092', new SeasonNewsLetterScheduler());
        Test.stopTest();
    }
}