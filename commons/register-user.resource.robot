*** Settings ***
Library    FakerLibrary
Resource    web.robot


*** Keywords ***
generate userinfo from FakerLibrary
    ${NAME}     FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    ${PWD}      FakerLibrary.Password    special_chars=False
    Set Test Variable    ${NAME}
    Set Test Variable    ${EMAIL}
    Set Test Variable    ${PWD}

I register an user
    generate userinfo from FakerLibrary
    Fill Text    //input[@name='username']    ${NAME}
    Fill Text    //input[@name='email']    ${EMAIL}
    Fill Text    //input[@name='password']    ${PWD}
    Click    //button[contains(.,'Sign up')]
    Wait for navigation    ${APP_URL}