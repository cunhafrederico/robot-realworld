*** Settings ***
Resource    ../commons/web.robot
Library    Collections

*** Variables ***
&{LINKS}=    Home=/    New Post=/editor    Settings=/settings    Global Feed=/?tab=all

*** Keywords ***
that I access the realworld homepage
    Wait Until Keyword Succeeds    2x    5 sec    
    ...    New page     url=${APP_URL}

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

the menu item '${MENU_ITEM}' must not be visible
    Set Browser Timeout    1 seconds
    Run Keyword And Expect Error    STARTS: TimeoutError: locator.elementHandle
    ...    Get Element    //a[contains(@class,'nav-link')][contains(.,'${MENU_ITEM}')]
    Set Browser Timeout    10 seconds

contain the feed type "${FEED_NAME}"
    ${LINK}=      Get From Dictionary    ${LINKS}    ${FEED_NAME}
    Get Element    //a[@href='/?tab=all'][contains(.,'${FEED_NAME}')]

contain a max of '${ARTICLES}' articles preview in this page
    Get Element Count    //div[@class='article-preview']    <=    ${ARTICLES}

contain a min of '${ARTICLES}' articles preview in this page
    Get Element Count    //div[@class='article-preview']    >=    ${ARTICLES}

every article must have a like buton
    ${ARTICLES_OBJ}=    Get Elements    //div[@class='article-preview']
    Set Local Variable    ${COUNTER}    ${0}
    FOR    ${ARTICLE_OBJ}    IN    @{ARTICLES_OBJ}
        Set Local Variable    ${COUNTER}    ${COUNTER+1}
        Set Browser Timeout    1 seconds
        Run Keyword And Expect Error        STARTS: TimeoutError: locator.elementHandle
        ...    Get Element    (//div[contains(@class,'article-preview')])[${COUNTER}]//div[@class='article-meta']//form//button//i[@class='ion-heart']
        Set Browser Timeout    10 seconds
    END

contain pagination element
    Get Element    //ul[@class='pagination']

pagination contain only one active item
    Get Element Count    //li[@class='page-item active']    ==    1

a popular tags box must be visible at the sidebar
    Get element    //div[@class='sidebar']//p[contains(.,'Popular Tags')]