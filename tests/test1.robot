*** Settings ***
Documentation    Create badges

Resource  ../../resources/.robot
Library   cumulusci.robotframework.PageObjects
Library  ../../resources/LandingPageObject.py
Suite Setup  Run keywords
...          Open test browser
...          Maximize browser window

Suite Teardown  Run Keywords
...          Capture Screenshot and Delete Records and Close Browser


*** Variables ***

*** Test Cases ***
T598
    [Documentation]  Create contact
    [Tags]  Automation
    Go to page                      Landing             contacts
        Wait until loading is complete
    Sleep  5s
    Select frame                    //iframe
    Click With JavaScript                   //div[@class="slds-button-group slds-float--right"]//child::button
        Sleep  3s
    Input  text               contact name          ${Contact_name}
    Click Element By Text        Save
        Wait until loading is complete
        sleep  5s
        Current frame should contain                    Next
        Current frame should contain                    ${Contact_name}
        Current frame should contain                    Status
        Current frame should contain                    Draft
        Current frame should contain                    Edit
        Current frame should contain                    Activate