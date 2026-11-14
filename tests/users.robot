*** settings***
Library        RequestsLibrary
Library        Collections
*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com

*** Test Cases ***
ask all users and verify status_code
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /users    expected_status=200
    ${content}=     Set Variable       ${response.json()}
    Length Should Be    ${content}    10

verify if all users have name, username and email fields
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /users
    ${content}=    Set Variable    ${response.json()}
        FOR    ${user}     IN     @{content}
            Dictionary Should Contain Key        ${user}    name
            Dictionary Should Contain Key        ${user}    username
            Dictionary Should Contain Key        ${user}    email
        END        

at least a user is from Wisokyburgh
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /users
    ${content}=    Set Variable    ${response.json()}
    ${Cities}=    Create List
    FOR    ${user}    IN    @{content}
        Append To List    ${Cities}    ${user}[address][city]
    END
    List Should Contain Value    ${Cities}    Wisokyburgh
    

    

