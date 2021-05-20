*** Settings ***
Resource   user_operation_implimenation.robot
*** Test Cases ***
Create user, valid details
    [Tags]  apidemo
    Given A valid "user_a" 
      And "user_a" with valid "name" "James Thomas4"
      And "user_a" with valid email "James.Thomas@test54.com"
      And "user_a" with valid gender "Male"
      And "user_a" with valid status "Active"
      Log   ${actors}
     When user creates A New user "user_a"
     Then "user_a" receives a response with code "201.0"

Create user, Invalid details
    [Tags]   apidemo  SIT_Regression
    Given A valid "user_a" 
      And "user_a" with valid "name" "James Thomas2"
      And "user_a" with valid email "%&#¤&#¤%#¤%#¤%"
      And "user_a" with valid gender "Male"
      And "user_a" with valid status "Active"
      Log   ${actors}
     When user creates A New user "user_a"
     Then "user_a" receives a response with code "422.0"
      And Respose contains Error Message Field "email" "is invalid"
