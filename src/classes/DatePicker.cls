public with sharing class DatePicker {
	String reportEndDate = Apexpages.currentPage().getParameters().get('reportEndDate');
	boolean debug = false;
	
	public String getReportEndDate() {
		return reportEndDate;
	}
	
	public PageReference getUrl() {
		reportEndDate = Apexpages.currentPage().getParameters().get('reportEndDate');
		
		if (debug) {
			ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.INFO,'reportEndDate: ' + reportEndDate);
			ApexPages.addMessage(errorMsg);
		}
		
		if (reportEndDate == null) {
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Invalid reportEndDate');
			ApexPages.addMessage(myMsg);
			return null;
		}
		
		// Do some date validations
		
		Date endDate = Date.parse(reportEndDate);
		Date maxDate = Date.today().addYears(1);
		
		// Don't allow the date to be prior to today
		
		if (endDate < Date.today()) {
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,
				'Report End date ' + reportEndDate + ' must be after today');
			ApexPages.addMessage(myMsg);

			return null;
		}
		
		// Just for debugging, don't allow the end date to be greater than one year out
		
		if (Math.abs(endDate.daysBetween(maxDate)) > 365) {
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,
				'Report End date ' + reportEndDate + ' must be less than one year out');
			ApexPages.addMessage(myMsg);

			return null;
		}
		
		String url = '/00Oo0000002qAb9?pv0=%27' + reportEndDate + '%27';

		if (debug) {
			ApexPages.Message urlMsg = new ApexPages.Message(ApexPages.Severity.INFO,'url: ' + url);
			ApexPages.addMessage(urlMsg);
		}

		PageReference p = new PageReference(url);
		p.setRedirect(true);
		return p;
	}
}