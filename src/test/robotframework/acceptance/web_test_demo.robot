*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  web_test_immplimentation.robot

*** Test Cases ***
CreateAccountPageContent
    [Tags]   demoweb
	Given User_a open "amazon.com"
      And user_a click Sign in Account
	  And User A Sign In Page Opened 
	when user_a click Create your Amazon Account
	Then "Amazon Registration" Page should be displayed
	 And The "Amazon Registration" Page should contain Label "Create account"
	 And The "Amazon Registration" Page should contain Label "Your name"
	 And The "Amazon Registration" Page should contain Textbox "customerName"
	 And The "Amazon Registration" Page should contain Label "Email"
     And The "Amazon Registration" Page should contain Textbox "email"
	 And The "Amazon Registration" Page should contain Label "Password"
     And The "Amazon Registration" Page should contain Textbox "password"
	 And The "Amazon Registration" Page's "password" Textbox should show "At least 6 characters"
     And The "Amazon Registration" Page should show the informattion "Passwords must be at least 6 characters."
	 And The "Amazon Registration" Page should contain Label "Re-enter password"
	 And The "Amazon Registration" Page should contain Textbox "passwordCheck"
	 And The "Amazon Registration" Page should display the "submit" Button "Create your Amazon account"
	 And The "Amazon Registration" Page should display "Already have an account? Sign-In" with link to "https://www.amazon.com/ap/signin?"
	 And The "Amazon Registration" Page should display "Purchasing for work? Create a business account" with link to "https://www.amazon.com/business/register/org/landing?ref_=ap_altreg_ab"
	 And The "Amazon Registration" Page should display Legal section "By creating an account, you agree to Amazon's Conditions of Use and Privacy Notice."
	 And Close Browser