*** settings***
Library        RequestsLibrary
Library        Collections
*** Variables ***
${base_url}    http://127.0.0.1:8000 

*** Test Cases ***
Request all users and verify status_code
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /books    expected_status=200
    Log To Console    ${response.content}
    ${content}=     Set Variable       ${response.json()}
    Length Should Be    ${content}    8

Request a book
    Create Session    my_session    ${base_url}
    ${response}=    GET On Session    my_session    /books/Romance    expected_status=200
    Log To Console    ${response.content}
    ${content}=     Set Variable       ${response.json()}
    Should Be Equal    ${content}[status]    vailable

Post Request Test   
    Create Session    my_session    ${base_url}
    &{data}=    Create dictionary    book_id=History    status=vailable
    ${resp}=    POST On Session    my_session    /books  json=${data}  expected_status=201 
    Log To Console    HTTP-Status: ${resp.status_code}
    Log To Console    Antwort: ${resp.text}
    ${content}=    Set Variable    ${resp.json()}
    Should Be Equal    ${content}[book_id]    History
    Should Be Equal    ${content}[status]    vailable

