//---------------------------------------------------------------------------------------------------------
//
//	Module:  TestServices
//
//---------------------------------------------------------------------------------------------------------
//
//  Date	Who		Description
//
// 09/29/14	mjm		Original version - helper classes for testing
//
//---------------------------------------------------------------------------------------------------------
@isTest
public with sharing class TestServices {

	public static Certification__c getCert( final String name, final Double initial, final Double renewal) {
		return new Certification__c(name=name, Initial__c=initial,Renewal__c=renewal, Active__c=true);
	}

	public static GroupCertification__c getGroupCert(final Group__c grp, Certification__c cert) {
		return new GroupCertification__c(Group__c=grp.Id, Certification__c=cert.Id);
	}

   public static Group__c getGroup(final String groupname) {
        return new Group__c(Name=groupname,Active__c=true);
    }

   public static Group__c getGroup(final String groupname, final String abbrev) {
        return new Group__c(Name=groupname,Group_Abbreviation__c=abbrev,Active__c=true);
    }

   public static Employee__c getEmployee(final String firstname, 
   										final String lastname, 
   										final Group__c grp,
   										final Date startdate) {
   		
        return new Employee__c(First_Name__c=firstname,Last_Name__c=lastname,Group__c=grp.Id,
             Start_Date__c=startdate);
    }

}