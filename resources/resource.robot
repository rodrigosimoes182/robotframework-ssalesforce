*** Settings ***
Resource       cumulusci/robotframework/Salesforce.robot
Library        FIELO.py
Library        DateTime

*** Keywords ***
API Get program
    [Documentation]  Get any existed program
    @{records}=  Salesforce Query  FieloPLT__Triggers__c  select=Id
    FOR  ${record}  IN  @{records}
        log  Id: ${record['Id']}
        Salesforce Delete  FieloPLT__Triggers__c  ${record['Id']}
    END
    ${result}=              SOQL Query
        ...                 SELECT Id FROM FieloPLT__Program__c
    ${record}=              Get from list                    ${result['records']}       0
    Set Suite Variable      ${program_id}                    ${record['Id']}
    &{program} =            Salesforce Get                   FieloPLT__Program__c               ${program_id}

API Get specific program
    [Documentation]  Get a specific program by given name, and clear all settings leaving as it comes as default
    [Arguments]  ${program_name}
    ${result}=              SOQL Query
        ...                 SELECT Id FROM FieloPLT__Program__c WHERE Name='${program_name}'
    ${record}=              Get from list                    ${result['records']}               0
    &{program} =            Salesforce Get                   FieloPLT__Program__c               ${record['Id']}

    Salesforce Update  FieloPLT__Program__c  ${record['Id']}
        ...  Name=${program_name}
        ...  FieloPLT__OnlineTransactionProcessing__c=true
        ...  FieloPLT__RequestMemberAuthorization__c=false
        ...  FieloPLT__CapAdjustmentTransactions__c=false
        ...  FieloPLT__RequestRedemptionAuthorization__c=false
        ...  FieloPLT__RequestUser__c=false
        ...  FieloPLT__RequestBudgetAuthorization__c=false
    Set Suite Variable      ${program_id}                    ${record['Id']}
    [Return]                &{program}

API Delete Program
    [Documentation]  First add permissions to the user
    #get the user you want to give admin permission
        ${result}=  SOQL Query
    ...  SELECT Id FROM user WHERE Name='User User'
    ${record}=  Get from list  ${result['records']}  0
    Set Suite Variable  ${user_id}  ${record['Id']}

    ${adminpermission}=  Salesforce Insert  FieloPLT__AdminPermission__c
    ...                 SetupOwnerId=${user_id}
    ...                 FieloPLT__To__c=2020-11-12T15:44:00.000+0000

    ###Insert here the action that demands admin permission######

    ###Insert here the action that demands admin permission######

    Salesforce Delete  FieloPLT__AdminPermission__c  ${adminpermission}

    #### Remove the admin permission
    Salesforce Delete  FieloPLT__AdminPermission__c  ${adminpermission}
