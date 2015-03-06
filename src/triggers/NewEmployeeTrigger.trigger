trigger NewEmployeeTrigger on Employee__c (after insert) {

    for (Employee__c e: Trigger.New) {
    	System.debug('Found employee: ' + e.First_Name__c);
        System.debug('Group: ' + e.Group__c);
            
        // Create the empty list to hold the new CertificationTracking entries
        
        List<CertificationTracking__c> certs = new List<CertificationTracking__c>();
        
        // Get a list of all certifications that belong to the employee's group
        List<GroupCertification__c> groupCerts = [select id, Name, 
                                                  Group__r.Name,
                                                  Certification__r.Name,
                                                  Certification__r.Initial__c,
                                                  Certification__r.Renewal__c
                                                  from GroupCertification__c
                                                  where Group__c = :e.Group__c];
        
        // Create a new CertificationTracking record for each of these and
        // attach it to the employee
        
        for (GroupCertification__c gc : groupCerts) {
            System.debug('(NewEmployeeTrigger) Group cert Group name: ' + gc.Group__r.Name);
            System.debug('(NewEmployeeTrigger) Group cert Cert name: ' + gc.Certification__r.Name);
            
            CertificationTracking__c certTrack = new CertificationTracking__c();
            
            certTrack.Employee__c = e.id;
            
            //This is done automatically when created (I think)
            //cert.Expired__c = 'N';
            certTrack.Certification__c = gc.Certification__c;
            
			//certTrack.Certification_Date__c = e.Start_Date__c;
            //System.debug('(NewEmployeeTrigger) Certification_Date__c: ' + certTrack.Certification_Date__c);
            
            //if (gc.Certification__r.Initial__c != null) {
				//certTrack.Certification_Date__c = e.Start_Date__c + gc.Certification__r.Renewal__c;
			//	certTrack.Certification_Date__c = e.Start_Date__c;
            //}
            
            System.debug('(NewEmployeeTrigger) Cert initial: ' + gc.Certification__r.Initial__c);
            System.debug('(NewEmployeeTrigger) Cert renewal: ' + gc.Certification__r.Renewal__c);
            
			// NOTE: the CertificationTracking RenewalDate is a calculated Formula,
			// based on the Certifications Renewal days and the Certification Date
			            
            System.debug('(NewEmployeeTrigger) insert CertTrack for emp Id: ' + e.Id);
            insert certTrack;
        }
    }
}