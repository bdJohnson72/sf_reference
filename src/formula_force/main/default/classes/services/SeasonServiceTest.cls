/**
 * Created by bjohnson on 11/18/23.
 */

@IsTest
private class SeasonServiceTest {
    @IsTest
    static void itShouldIssueNewsLetter() {
        SeasonService.issueNewsLetters(null);
    }
}