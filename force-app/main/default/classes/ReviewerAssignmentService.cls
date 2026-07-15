public with sharing class ReviewerAssignmentService {
    @InvocableMethod(label='Assign Reviewer' description='Returns an active reviewer user id for assignment')
    public static List<AssignmentResult> assignReviewer(List<AssignmentRequest> requests) {
        List<User> reviewers = [
            SELECT Id
            FROM User
            WHERE IsActive = true
            AND UserRole.Name = 'Reviewer'
            ORDER BY LastModifiedDate DESC
            LIMIT 50
        ];

        Integer randomIndex = reviewers.isEmpty()
            ? 0
            : Math.mod(Math.abs(Crypto.getRandomInteger()), reviewers.size());
        Id selectedId = reviewers.isEmpty() ? UserInfo.getUserId() : reviewers[randomIndex].Id;

        List<AssignmentResult> results = new List<AssignmentResult>();
        for (AssignmentRequest req : requests) {
            AssignmentResult result = new AssignmentResult();
            result.reviewerId = selectedId;
            result.applicationId = req.applicationId;
            results.add(result);
        }
        return results;
    }

    public class AssignmentRequest {
        @InvocableVariable(required=true)
        public Id applicationId;
    }

    public class AssignmentResult {
        @InvocableVariable
        public Id applicationId;

        @InvocableVariable
        public Id reviewerId;
    }
}
