*** Settings ***
Documentation    Create badges

Resource  ../../resources/.robot
Library   cumulusci.robotframework.PageObjects
Library  ../../resources/LandingPageObject.py
Suite Setup  Run keywords
...          Open test browser
...          Maximize browser window
...          API Get program

Suite Teardown  Run Keywords
...          API Clear All
...          Capture Screenshot and Delete Records and Close Browser


*** Variables ***
${badge_name}   Badge - created by robot

*** Test Cases ***
T598
    [Documentation]  Create badge
    [Tags]  Automation
    Go to page                      Landing             PLT__Badges
        Wait until loading is complete
    Sleep  5s
    Select frame                    //iframe
    Click With Js                   //div[@class="slds-button-group slds-float--right"]//child::button
        Sleep  3s
    Input  text                Badge Name          ${badge_name}
    Click Element By Text        Save
        Wait until loading is complete
        sleep  5s
        Current frame should contain                    Next
        Current frame should contain                    ${badge_name}
        Current frame should contain                    Status
        Current frame should contain                    Draft
        Current frame should contain                    Edit
        Current frame should contain                    Activate