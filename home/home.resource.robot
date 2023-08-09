*** Settings ***
Resource    ../commons/web.robot
Library    Collections

*** Keywords ***
that I access the realworld homepage
    New page     url=${APP_URL}

page is loaded
    Get Page Errors   ==    '[]'

the title must have '${TITLE_TEXT}' as definition
    Get title    ==    ${TITLE_TEXT}

the menu item '${MENU_ITEM}' must be visible and point to the right link
    Get Element                (//a[contains(@class,'nav-link')][contains(.,'${MENU_ITEM}')])
    ${VALUE}=      Get From Dictionary    ${LINKS}    ${MENU_ITEM}

the menu item '${MENU_ITEM}' must not be visible and point to the right link
    Get Element                (//a[contains(@class,'nav-link')][contains(.,'${MENU_ITEM}')])

O input de nome "${INPUT_NAME}" deve ser exibido
    Get Element    xpath=//input[@name="${INPUT_NAME}"]

O botão de entrar deve ser exibido
    Get Element States    id=botao-entrar    contains    visible

Devo ser redirecionado para a página principal
    Wait for navigation    ${CMS_URL}/

Deve ser exibido um alerta informando "${ALERT_DESCRIPTION}"
    Get Element States    xpath=//div[@role="alert"]    contains    visible
    Get Text   xpath=//div[@role="alert"]    *=    ${ALERT_DESCRIPTION}