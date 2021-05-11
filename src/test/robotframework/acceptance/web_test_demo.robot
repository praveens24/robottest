*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Documentation
...    Login Test Case.


***Variables***
${Browser}  chrome
${URL}  https://www.amazon.com/

 
*** Test Cases ***
Create Account,Page Content
    [Tags]   webtest
	#User_a open "amazon.com"
    Open Browser  ${URL}  ${Browser}
	Title Should Be  Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more
	#user_a Sign in Account
	Click Element  xpath=//*[@id="nav-link-accountList-nav-line-1"]
	Title Should Be  Amazon Sign-In
	#User Sign in page opened 
	#when user a click Create your Amazon Account
	Click Element  xpath=//*[@id="createAccountSubmit"]
	#Then "Amazon Registration" Page should be displayed
	
	Title Should Be    Amazon Registration
	# The "Amazon Registration" Page should contain Label "Create account"
	Element Should Be Visible  xpath=//*[contains(text(), "Create account")]
	# The "Amazon Registration" Page should contain Label "Your name"
	Element Should Be Visible  xpath=//*[contains(text(),"Your name")]
	#The "Amazon Registration" Page should contain Testbox "customerName"
	Element Should Be Visible  xpath=//input[@name="customerName" and @type="text"]
	#The "Amazon Registration" Page should contain Label "Email"
	Element Should Be Visible  xpath=//*[contains(text(), "Email")]
	#The "Amazon Registration" Page should contain Testbox "email"
	Element Should Be Visible  xpath=//input[@name="email" and @type="email"]
	#The "Amazon Registration" Page should contain Label "Password"
	Element Should Be Visible  xpath=//*[contains(text(),"Password")]
    #The "Amazon Registration" Page should contain Testbox "password"
	Element Should Be Visible  xpath=//input[@name="password" and @type="password"]
	#The "Amazon Registration" Page's "password" Testbox should show "At least 6 characters"
	${placeholder}  Get Element Attribute  xpath=//*[@name="password" and @type="password"]   placeholder   
	Should Be Equal As Strings   ${placeholder}   At least 6 characters
	##The "Amazon Registration" Page should show the informattion "Passwords must be at least 6 characters."
	Element Text Should Be   xpath=//*[@class="a-box a-alert-inline a-alert-inline-info auth-inlined-information-message a-spacing-top-mini"]//*[@class="a-box-inner a-alert-container"]//*[@class="a-alert-content"]   Passwords must be at least 6 characters.
	
	#The "Amazon Registration" Page should contain Label "Re-enter password"
	Element Should Be Visible  xpath=//label[contains(text(),'Re-enter password')]
	#The "Amazon Registration" Page should contain Testbox "passwordCheck"
	Element Should Be Visible  xpath=//input[@name="passwordCheck" and @type="password"]
    #The "Amazon Registration" Page should display the "submit" Button "Create your Amazon account"
	Element Text Should Be     xpath=//*[@id="continue" and @type="submit"]//following-sibling::span  Create your Amazon account
	#The "Amazon Registration" Page should display "Already have an account? Sign-In" with link to "https://www.amazon.com/ap/signin?"
	Element Text Should Be     xpath=//a[contains(text(),'Sign-In')]//parent::div[@class="a-row"]  Already have an account? Sign-In
	${url}=  get element attribute   xpath=//a[contains(text(),'Sign-In')]  href
    Should Contain  ${url}   https://www.amazon.com/ap/signin?
	#The "Amazon Registration" Page should display "Purchasing for work? Create a business account" with link to "https://www.amazon.com/business/register/org/landing?ref_=ap_altreg_ab"
	Element Text Should Be     xpath=//a[contains(text(),'Create a business account')]//parent::div[@class="a-row"]   Purchasing for work? Create a business account
    ${url}=  get element attribute   xpath=//a[contains(text(),'Create a business account')]  href
    Should Contain  ${url}   https://www.amazon.com/business/register/org/landing?ref_=ap_altreg_ab	

    #The "Amazon Registration" Page should display Legal section "By creating an account, you agree to Amazon's Conditions of Use and Privacy Notice."
	Element Text Should Be    xpath=//div[@id="legalTextRow" and @class="a-row a-spacing-top-medium a-size-small"]   By creating an account, you agree to Amazon's Conditions of Use and Privacy Notice.
	Page Should Contain Link   xpath=//div//a[@href="/gp/help/customer/display.html/ref=ap_register_notification_condition_of_use?ie=UTF8&nodeId=508088"]
	Page Should Contain Link   xpath=//div//a[@href="/gp/help/customer/display.html/ref=ap_register_notification_privacy_notice?ie=UTF8&nodeId=468496"]
    ${url}    Get Element Attribute   //div[@id="legalTextRow"]//a   href
	Should Contain  ${url}   https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_condition_of_use?ie=UTF8&nodeId=508088
	${url}    Get Element Attribute   //div[@id="legalTextRow"]//a//following-sibling::a   href
	Log  ${url}
	Should Contain  ${url}    https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_privacy_notice?ie=UTF8&nodeId=468496
	Close Browser