*** Settings ***
Library   Collections
*** Variables ***
&{actors}   

*** Keywords ***
Create actor
    [Arguments]  ${dict_name}
    &{dict}  	Create Dictionary  ${Empty}  ${Empty}
    Set To Dictionary  ${actors}  ${dict_name}  ${dict}
    Remove From Dictionary  ${actors["${dict_name}"]}  ${Empty}
    
Set actor
    [Arguments]  ${dict_name}  ${key}  ${value}
    Set To Dictionary  ${actors["${dict_name}"]}  ${key}  ${value}
Get actor
    [Arguments]  ${dict_name}
    ${value}    Get From Dictionary 	${actors} 	${dict_name}
    [Return]    ${value}