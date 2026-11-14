*** settings***
Library        RequestsLibrary

*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com

*** Test Cases ***
ask all users and verify status_code
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /users    expected_status=200
    ${content}=     Set Variable       ${response.json()}
    Length Should Be    ${content}    10
    

