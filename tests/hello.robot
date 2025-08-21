*** Settings ***
Library    Browser

*** Test Cases ***
Abrir Google
    New Browser    headless=False    browser=chromium
    New Page    https://www.google.com
    Get Title    ==    Google
    Close Browser
