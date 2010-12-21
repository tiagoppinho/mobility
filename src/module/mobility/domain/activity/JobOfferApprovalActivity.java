package module.mobility.domain.activity;

import module.mobility.domain.JobOffer;
import module.mobility.domain.JobOfferProcess;
import module.mobility.domain.MobilitySystem;
import module.workflow.activities.ActivityInformation;
import module.workflow.activities.WorkflowActivity;
import myorg.domain.User;

public class JobOfferApprovalActivity extends WorkflowActivity<JobOfferProcess, JobOfferApprovalInformation> {

    @Override
    public boolean isActive(JobOfferProcess process, User user) {
	JobOffer jobOffer = process.getJobOffer();
	return jobOffer.isPendingApproval(user) && MobilitySystem.getInstance().isManagementMember(user);
    }

    @Override
    protected void process(JobOfferApprovalInformation activityInformation) {
	activityInformation.getProcess().getJobOffer()
		.approve(activityInformation.getPublicationBeginDate(), activityInformation.getPublicationEndDate());
    }

    @Override
    public ActivityInformation<JobOfferProcess> getActivityInformation(JobOfferProcess process) {
	return new JobOfferApprovalInformation(process, this);
    }

    @Override
    public String getUsedBundle() {
	return "resources/MobilityResources";
    }
}
