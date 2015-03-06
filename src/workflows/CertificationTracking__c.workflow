<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Initial_Renew_Date</fullName>
        <description>Sets the initial renew date when a CertificationTracking record is created.</description>
        <field>Renewal_Date__c</field>
        <formula>Certification__r.Initial__c +  Certification_Date__c</formula>
        <name>Initial Renew Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Renew_Date</fullName>
        <description>This will update the Renew Date whenever the CertificationTracking object is changed.</description>
        <field>Renewal_Date__c</field>
        <formula>IF(ISBLANK(Certification__r.Renewal__c),
DATE(2199,12,31),
Certification__r.Renewal__c +  Certification_Date__c)</formula>
        <name>Update Renew Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Initial Renew Date</fullName>
        <actions>
            <name>Initial_Renew_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Renewal date to Employee start date plus Certification Initial number of days</description>
        <formula>NOT(ISBLANK(Certification__r.Initial__c))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Renew Date</fullName>
        <actions>
            <name>Update_Renew_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the Renewal Date</description>
        <formula>ISCHANGED( Certification_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
