*** Settings ***
Resource   user_operation_implimenation.robot
*** Test Cases ***
Create user, valid details
    [Tags]  Test1
    Given A valid "user_a" 
      And "user_a" with valid "name" "James Thomas2"
      And "user_a" with valid email "James.Thomas@test2.com"
      And "user_a" with valid gender "Male"
      And "user_a" with valid status "Active"
      Log   ${actors}
     When user creates A New user "user_a"
     Then "user_a" receives a response with code "201.0"
