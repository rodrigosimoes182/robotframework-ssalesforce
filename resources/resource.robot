*** Settings ***
Documentation    Resource Robot File
...              Status: This test is not working yet
...              Last update: November 16th 2022
...              Purpose: Create keyword to be used on test case
Resource       cumulusci/robotframework/Salesforce.robot
Library        resources.py
Library        DateTime

*** Keywords ***
API Get Acess Saleforce
    [Documentation]  Access sales force
    [Arguments]  ${program_name}
    ${result}=              SOQL Query
        ...                 SELECT Id FROM __Program__c WHERE Name='${program_name}'
    ${record}=              Get from list                    ${result['records']}               0
    &{program} =            Salesforce Get                   __Program__c               ${record['Id']}

API Delete Contact
    [Documentation]  First add permissions to the user
        ${result}=  SOQL Query
    ...  SELECT Id FROM user WHERE Name='User User'
    ${record}=  Get from list  ${result['records']}  0
    Set Suite Variable  ${user_id}  ${record['Id']}

    ${adminpermission}=  Salesforce Insert  __AdminPermission__c
    ...                 SetupOwnerId=${user_id}
    ...                 __To__c=2020-11-12T15:44:00.000+0000

    ### Insert here the action that demands admin permission######

    Salesforce Delete  __AdminPermission__c  ${adminpermission}

    #### Remove the admin permission
    Salesforce Delete  __AdminPermission__c  ${adminpermission}
