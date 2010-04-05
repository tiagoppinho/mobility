package module.mobility.domain.activity;

import java.util.Calendar;

import module.mobility.domain.PersonalPortfolioProcess;
import module.workflow.activities.ActivityInformation;
import module.workflow.activities.WorkflowActivity;

import org.joda.time.DateTime;

public class WorkerJobOfferInformation extends ActivityInformation<PersonalPortfolioProcess> {

    private int year = Calendar.getInstance().get(Calendar.YEAR);
    private DateTime beginDate = new DateTime();
    private DateTime endDate;

    private Boolean displayName = Boolean.FALSE;
    private Boolean displayDateOfBirth = Boolean.FALSE;
    private Boolean displayCarrer = Boolean.FALSE;
    private Boolean displayCategory = Boolean.FALSE;
    private Boolean displaySalary = Boolean.FALSE;

    public WorkerJobOfferInformation(final PersonalPortfolioProcess process,
	    WorkflowActivity<PersonalPortfolioProcess, ? extends ActivityInformation<PersonalPortfolioProcess>> activity) {
	super(process, activity);
    }

    @Override
    public boolean hasAllneededInfo() {
	return isForwardedFromInput();
    }

    public DateTime getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(DateTime beginDate) {
        this.beginDate = beginDate;
    }

    public DateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(DateTime endDate) {
        this.endDate = endDate;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Boolean getDisplayName() {
        return displayName;
    }

    public void setDisplayName(Boolean displayName) {
        this.displayName = displayName;
    }

    public Boolean getDisplayDateOfBirth() {
        return displayDateOfBirth;
    }

    public void setDisplayDateOfBirth(Boolean displayDateOfBirth) {
        this.displayDateOfBirth = displayDateOfBirth;
    }

    public Boolean getDisplayCarrer() {
        return displayCarrer;
    }

    public void setDisplayCarrer(Boolean displayCarrer) {
        this.displayCarrer = displayCarrer;
    }

    public Boolean getDisplayCategory() {
        return displayCategory;
    }

    public void setDisplayCategory(Boolean displayCategory) {
        this.displayCategory = displayCategory;
    }

    public Boolean getDisplaySalary() {
        return displaySalary;
    }

    public void setDisplaySalary(Boolean displaySalary) {
        this.displaySalary = displaySalary;
    }

}