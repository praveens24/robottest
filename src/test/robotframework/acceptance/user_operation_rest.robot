*** Settings ***
Library   HttpRequestLibrary

*** Variables ***
${testServer}    https://gorest.co.in/public-api

*** Keywords ***
post a new user creation rest call
    [Arguments]   ${payload}
    &{headers}  	Create Dictionary   Accept  application/json   Content-Type   application/json    Authorization  Bearer 69bf10c972c282ca767c5405f90fb1449f8b80b96c3d82bdea0e4cfa2b023cf8
    ${json_payload}     evaluate        json.dumps(${payload})                 json
    Create Session  httpbin  ${testServer}
    ${resp}=  Post Request  httpbin  /users  data=${json_payload}  headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200
    [Return]  ${resp}