*** settings***
Library        RequestsLibrary
Library        Collections
*** Variables ***
${base_url}    http://127.0.0.1:8000 

*** Test Cases ***
ask all users and verify status_code
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /books    expected_status=200
    Log To Console    ${response.content}
    ${content}=     Set Variable       ${response.json()}
    Length Should Be    ${content}    3