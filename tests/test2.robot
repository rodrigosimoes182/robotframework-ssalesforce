*** Settings ***
Documentation     Abre o org com Playwright e valida a Home (Lightning).
Resource          cumulusci/robotframework/SalesforcePlaywright.robot
Suite Setup       Open Test Browser
Suite Teardown    Delete Records And Close Browser

*** Test Cases ***
Acessar Home do Salesforce (Playwright)
    [Documentation]    Garante a Home carregada no Lightning.
    Wait Until Salesforce Is Ready

    # Ir direto para a Home Lightning (usa URL do org conectado)
    &{org}=           Get Org Info
    ${home_url}=      Set Variable    ${org['instance_url']}/lightning/page/home
    Go To             ${home_url}
    Wait Until Network Is Idle

    # Asserções básicas
    ${url}=           Get Url
    Should Contain    ${url}    /lightning/page/home

    # App Launcher visível (waffle)
    Wait For Elements State    button:has-text("App Launcher")    visible
    # Shell do Lightning presente
    Wait For Elements State    css:one-app    visible
