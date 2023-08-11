*** Settings ***
Library    Browser    run_on_failure=${None}
Library    Collections

*** Variables ***
&{LINKS}=    Home=/    New Post=/editor    Settings=/settings    Global Feed=/?tab=all    Sign in=/login    Sign up=/register

*** Keywords ***
that I access the realworld '${PAGE}' page
    ${PAGE_LINK}=    Get From Dictionary    ${LINKS}    ${PAGE}    
    Wait Until Keyword Succeeds    2x    5 sec
    ...    New page     url=${APP_URL}${PAGE_LINK}

page is loaded
    ${PAGE_ERRORS}=    Get Page Errors
    Length Should Be    ${PAGE_ERRORS}    0

the title must have '${TITLE_TEXT}' as definition
    Get title    ==    ${TITLE_TEXT}

the menu item '${MENU_ITEM}' must be visible and point to the right link
    ${LINK}=      Get From Dictionary    ${LINKS}    ${MENU_ITEM}
    Get Element                //a[contains(@class,'nav-link')][contains(.,'${MENU_ITEM}')][contains(@href,'${LINK}')]

the menu item '${MENU_ITEM}' must be active
    Get Classes    text=${MENU_ITEM}    *=    active

the menu item '${MENU_ITEM}' must ${VERB} visible
    IF    "${VERB}" == "not be"
        Set Test Variable    ${DECISION}    0
    ELSE
        Set Test Variable    ${DECISION}    1
    END
    Get Element Count       //a[contains(@class,'nav-link')][contains(.,'${MENU_ITEM}')]    ==    ${DECISION}

I will be redirected to '${PAGE}' page
    ${PAGE_LINK}=    Get From Dictionary    ${LINKS}    ${PAGE}
    Wait For Navigation    ${APP_URL}${PAGE_LINK}

get an evidence
    Take Screenshot    EMBED