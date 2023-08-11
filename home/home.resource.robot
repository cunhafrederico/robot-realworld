*** Settings ***
Resource    ../commons/web.robot

*** Variables ***


*** Keywords ***
contain the feed type "${FEED_NAME}"
    ${LINK}=      Get From Dictionary    ${LINKS}    ${FEED_NAME}
    Get Element    //a[@href='/?tab=all'][contains(.,'${FEED_NAME}')]

contain a max of '${ARTICLES}' articles preview in this page
    Get Element Count    //div[@class='article-preview']    <=    ${ARTICLES}

contain a min of '${ARTICLES}' articles preview in this page
    Get Element Count    //div[@class='article-preview']    >=    ${ARTICLES}

every article must ${HAVE_OR_NOT} a like buton
    ${ARTICLES_OBJ}=    Get Elements    //div[@class='article-preview']
    IF    '${HAVE_OR_NOT}' == 'not have'
        Set Test Variable    ${DECISION}    0
    ELSE
        Set Test Variable    ${DECISION}    1
    END
    Set Local Variable    ${COUNTER}    ${0}
    FOR    ${ARTICLE_OBJ}    IN    @{ARTICLES_OBJ}
        Set Local Variable    ${COUNTER}    ${COUNTER+1}
        Get Element Count    (//div[contains(@class,'article-preview')])[${COUNTER}]//div[@class='article-meta']//form//button//i[@class='ion-heart']    ==    ${DECISION}
    END

contain pagination element
    Get Element    //ul[@class='pagination']

pagination contain only one active item
    Get Element Count    //li[@class='page-item active']    ==    1

a popular tags box must be visible at the sidebar
    Get element    //div[@class='sidebar']//p[contains(.,'Popular Tags')]
    Get element    //div[@class='sidebar']//div[@class='tag-list']

the tags box must be populated with at least '${TAGS_NUM}' tag
    Get element Count    //a[contains(@class,'tag-default tag-pill')]    >=    1