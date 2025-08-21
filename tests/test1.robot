*** Settings ***
Documentation     Acessa a Home (Lightning) e faz checagens básicas.
Library           cumulusci.robotframework.Salesforce
Library           cumulusci.robotframework.PageObjects
Library           SeleniumLibrary
Suite Setup       Open Test Browser
Suite Teardown    Close All Browsers

*** Test Cases ***
Abrir Home do Salesforce
    [Documentation]    Navega até a Home do Salesforce Lightning e valida elementos chave.
    Go To Page    Home
    Wait Until Salesforce Is Ready

    # Confirma que é a página de Home (URL canônica do Lightning)
    Location Should Contain    /lightning/page/home

    # Valida presença do “waffle” (App Launcher) no header — estável entre orgs.
    Wait Until Keyword Succeeds    5x    2s
    ...    Page Should Contain Element    css:button.slds-icon-waffle

    # Opcional: valida que o shell do Lightning carregou
    Page Should Contain Element    css:one-app

    # (Opcional) Faça uma asserção de título visível comum em muitas orgs
