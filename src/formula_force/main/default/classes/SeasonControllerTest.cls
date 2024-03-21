/**
 * Created by bjohnson on 11/18/23.
 */

@IsTest
private class SeasonControllerTest {
    @IsTest
    static void itShouldSendNewsLetter() {
        try {
            SeasonController.sendNewsLetter();
            Assert.fail();
        } catch (Exception e) {
            Assert.isTrue('Not yet Implemented' == e.getMessage());
        }
    }
}