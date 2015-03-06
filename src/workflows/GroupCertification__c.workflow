<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>UpdateGroupCertUniqueKey</fullName>
        <field>GroupCertDupCheck__c</field>
        <formula>Certification__r.Name + &apos;-&apos; +  Group__r.Group_Abbreviation__c</formula>
        <name>UpdateGroupCertUniqueKey</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>GroupCertDupCheck</fullName>
        <actions>
            <name>UpdateGroupCertUniqueKey</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISBLANK( GroupCertDupCheck__c ) ,
ISCHANGED( GroupCertDupCheck__c  ) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
