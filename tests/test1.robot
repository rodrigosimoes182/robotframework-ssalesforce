*** Settings ***
Documentation    Create Contact
...              Status: This test is not working yet
...              Last update: November 16th 2022

Resource  ../../resources/.robot
Library   cumulusci.robotframework.PageObjects
Library  ../../resources/LandingPageObject.py
Suite Setup  Run keywords
...          Open test browser
...          Maximize browser window

Suite Teardown  Run Keywords
...          Capture Screenshot and Delete Records and Close Browser


*** Variables ***
### In this part of test is possible to insert the variable used during test
${Contact_name}=    "//div[@class="slds-button-group slds-float--right"]//child::button"
*** Test Cases ***
Test Number One
    [Documentation]  Create Contact
    [Tags]  Test Dummy
    Go to page                      Landing             contacts
        Wait until loading is complete
    Sleep  5s
    Select frame                    //iframe
    Input  text               contact name          ${Contact_name}
    Click Element By Text        Save
        Wait until loading is complete
        sleep  5s
        Current frame should contain                    Next