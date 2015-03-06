<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Clear_I9_Date</fullName>
        <description>Clear the I-9 Date (when I-9 Provided checkbox is cleared)</description>
        <field>I9_Expiration_Date__c</field>
        <name>Clear I9 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Reset I9 Date</fullName>
        <actions>
            <name>Clear_I9_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Reset the I-9 Date when the I-9 Provided checkbox is cleared.</description>
        <formula>AND((PRIORVALUE(I9_Provided__c) = True),
I9_Provided__c = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
