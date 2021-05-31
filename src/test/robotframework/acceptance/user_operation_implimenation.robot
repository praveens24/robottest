*** Settings ***
Resource   common_implimentation.robot
Resource   user_operation_rest.robot
*** Variables ***
${respo}    
*** Keywords ***
A valid "${user_alias}"
    Create actor    ${user_alias}

"${user_alias}" with valid name "${user_name}"
    Set actor    ${user_alias}    name    ${user_name}

"${user_alias}" with valid "${key_name}" "${key_value}"
    Set actor    ${user_alias}    ${key_name}    ${key_value}

"${user_alias}" with valid email "${user_email}"
    Set actor    ${user_alias}    email    ${user_email}

"${user_alias}" with valid gender "${user_gender}"
    Set actor    ${user_alias}    gender    ${user_gender}
    
"${user_alias}" with valid status "${user_status}"
    Set actor    ${user_alias}    status    ${user_status}
    Log  ${actors}

user creates A New user "${user_alias}"
    ${data_load}  Get actor    ${user_alias}
    ${response}   post a new user creation rest call   ${data_load}
    #${respo}   evaluate    json.loads('''${response}''')    json
    Set Suite Variable      ${respo}   ${response}

"${user_alias}" receives a response with code "${code}"
    Log  ${respo.json}
    Should Be Equal As Strings   ${respo.json['code']}   ${code}

Respose contains Error Message Field "${fieldname}" "${errormessage}"
    &{temp}   Set Variable     ${respo.json['data']}[0]
    Log  ${temp.field}
    Log  ${temp.message}
    Log  ${errormessage}
    Should Contain   ${temp.field}      ${fieldname}     msg=Invalid Field ${fieldname} not mentioned in the error!
    Should Contain   ${temp.message}    ${errormessage}  msg=${fieldname} ${errormessage} not mentioned in the error!  