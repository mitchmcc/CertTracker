//---------------------------------------------------------------------------------------------------------
//
//	Module:  NewEmployeeAddTestClass
//
//---------------------------------------------------------------------------------------------------------
//
//  Date	Who		Description
//
// 09/29/14	mjm		Original version - test classes 
//
//---------------------------------------------------------------------------------------------------------
/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest (SeeAllData=true)
private class NewEmployeeAddTestClass {

    static testMethod void validateGroupCerts() {
    	Date startDate = Date.newInstance(2014,9,1);
    	
    	System.debug('(validateGroupCerts) enter');
    	
    	System.debug('(validateGroupCerts) creating Certifications');
    	
    	// Create basic set of Groups, Certifications, and GroupCertifications for this test
    	
    	Certification__c tbcert = TestServices.getCert('TB Test', 30, 365);
    	insert tbcert;
    	
    	Certification__c blscert = TestServices.getCert('BLS', 30, 365);
    	insert blscert;
    	
    	System.debug('(validateGroupCerts) creating Group');
    	Group__c grp = TestServices.getGroup('Registered Nurse', 'RN');
    	insert grp;
    	
    	System.debug('(validateGroupCerts) creating GroupCertification tb');
    	GroupCertification__c gc = TestServices.getGroupCert(grp, tbcert);
    	insert gc;

    	System.debug('(validateGroupCerts) creating GroupCertification bls');
    	GroupCertification__c gc2 = TestServices.getGroupCert(grp, blscert);
    	insert gc2;
    	
    	// FOR DEBUG ONLY
    	
    	for (GroupCertification__c gc3 : [SELECT id,Name from GroupCertification__c WHERE id = :gc.Id or id = :gc2.Id]) {
    		System.debug('>>>> found gc: ' + gc3.Name);
    	}
    	// END DEBUG
    	
        Employee__c newEmp = TestServices.getEmployee('McConnell', 'Mitch', grp, startDate);
        insert newEmp;
        
        Employee__c e = [Select Id, Name from Employee__c where Id = :newEmp.Id];
        
        List<CertificationTracking__c> certsList = [Select Id, Name from CertificationTracking__c where Employee__c = :newEmp.Id];
        
        System.debug('Empl Id: ' + e.Id + ', Name: ' + e.Name + ', Count of certs found: ' + certsList.size());
        
        for (CertificationTracking__c c : certsList) {
        	System.debug('Found CT: ' + c.Name);
        }
        
        System.assertEquals(2, certsList.size());
        
    }
}