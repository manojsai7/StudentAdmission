# AI-Enabled Student Admission System (Salesforce DX)

This repository contains a Salesforce DX metadata project for a student admission workflow that covers:
- Data model: Program, Application, Review, and Applicant Type on Contact.
- Validation rules and approval process.
- Email templates + alerts.
- Record-triggered automation flow for submitted applications.
- Agentforce Prompt Template for admission recommendation.
- Lightning App, tabs, layouts, and dynamic-form-ready flexipage.
- Duplicate/matching rules and role/profile/permission setup.

## Deployment

```bash
sf org login web -a devhub
sf project deploy start --source-dir force-app
```

If using legacy CLI:

```bash
sfdx force:source:deploy -p force-app
```

## Sample Data Setup
1. Create 2 `Program__c` records with capacities > 0.
2. Create 3 Contact records and set `Applicant_Type__c`.
3. Create 5 `Application__c` records tied to applicants and programs.
4. Change status to `Submitted` to trigger flow + review creation.

## Included Validation Rules
- `Future_Submission_Date`
- `Decision_After_Submission`
- `Locked_Approved_Status`
- `Program_Capacity_Check`
- `Positive_Capacity` (Program)
- `Score_Range` (Review)

## Included Automation
- Approval Process: `Application_Approval_Process`
- Flow: `Application_Submission_Flow`
- Apex Invocable: `ReviewerAssignmentService.assignReviewer`
- Prompt Template: `Admission_Recommendation`

## Screenshots (placeholders)
- [ ] Object model ERD
- [ ] Validation rules
- [ ] Approval process
- [ ] Flow canvas
- [ ] Lightning app + record page
- [ ] Duplicate/matching rules

## Notes
- OWD target for `Application__c` is set to `Private` via object sharing model.
- Permission sets and profiles are included for Admission Officer and Reviewer personas.
