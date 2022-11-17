*** Settings ***
Documentation    Resource Robot File
...              Status: This test is not working yet
...              Last update: November 16th 2022
...              Purpose: Create keyword to be used on test case
Resource       cumulusci/robotframework/Salesforce.robot
Library        resources.py
Library        DateTime

*** Keywords ***
API Get program
    [Documentation]  Get any existed program
    @{records}=  Salesforce Query  __Triggers__c  select=Id
    FOR  ${record}  IN  @{records}
        log  Id: ${record['Id']}
        Salesforce Delete  __Triggers__c  ${record['Id']}
    END
    ${result}=              SOQL Query
        ...                 SELECT Id FROM __Program__c
    ${record}=              Get from list                    ${result['records']}       0
    Set Suite Variable      ${program_id}                    ${record['Id']}
    &{program} =            Salesforce Get                   __Program__c               ${program_id}

API Get Acess Saleforce
    [Documentation]  Access sales force
    [Arguments]  ${program_name}
    ${result}=              SOQL Query
        ...                 SELECT Id FROM __Program__c WHERE Name='${program_name}'
    ${record}=              Get from list                    ${result['records']}               0
    &{program} =            Salesforce Get                   __Program__c               ${record['Id']}

    Salesforce Update  __Program__c  ${record['Id']}
        ...  Name=${program_name}
        ...  __OnlineTransactionProcessing__c=true
        ...  __RequestMemberAuthorization__c=false
        ...  __CapAdjustmentTransactions__c=false
        ...  __RequestRedemptionAuthorization__c=false
        ...  __RequestUser__c=false
        ...  __RequestBudgetAuthorization__c=false
    Set Suite Variable      ${program_id}                    ${record['Id']}
    [Return]                &{program}

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
