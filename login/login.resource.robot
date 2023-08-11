*** Settings ***
Resource    ../commons/web.robot

*** Variables ***

*** Keywords ***
I login in with valid email and password
    fill input name email with valid value
    fill input name password with valid value
    click in Sign in button

I login in with valid email and invalid password
    fill input name email with invalid value
    fill input name password with valid value
    click in Sign in button

I login in with invalid email and valid password
    fill input name email with valid value
    fill input name password with invalid value
    click in Sign in button

I login in with invalid email and password
    fill input name email with invalid value
    fill input name password with invalid value
    click in Sign in button

fill input name ${NAME} with ${VALID_OR_INVALID} value
    IF    '${VALID_OR_INVALID}' == 'valid'
        Fill Text    //input[@name='${NAME}']    ${VALID_${NAME}}
    ELSE
        Fill Text    //input[@name='${NAME}']    ${INVALID_${NAME}}
    END

click in Sign in button
    Click    //button[contains(.,'Sign in')]

login page will show a big message '${MESSAGE}'
    Get element Count    //h1[contains(.,'${MESSAGE}')]    ==    1