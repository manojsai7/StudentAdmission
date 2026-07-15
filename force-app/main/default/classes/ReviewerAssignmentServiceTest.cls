@IsTest
private class ReviewerAssignmentServiceTest {
    @IsTest
    static void returnsCurrentUserWhenNoReviewerRoleUsers() {
        ReviewerAssignmentService.AssignmentRequest req = new ReviewerAssignmentService.AssignmentRequest();
        req.applicationId = UserInfo.getUserId();

        Test.startTest();
        List<ReviewerAssignmentService.AssignmentResult> results = ReviewerAssignmentService.assignReviewer(
            new List<ReviewerAssignmentService.AssignmentRequest>{ req }
        );
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assertNotEquals(null, results[0].reviewerId);
    }
}
