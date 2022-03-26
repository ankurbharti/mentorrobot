*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${BROWSER}              Firefox
#${Firefox}              "C:\Users\user\AppData\Local\Programs\Python\Python310\Scripts\geckodriver.exe"
${url}                  https://phptravels.org/demo/
${register}             xpath://*[contains(text(),'Register')]
${firstname}            xpath://*[@id='inputFirstName']
${lastname}             xpath://*[@id='inputLastName']
${email}                xpath://*[@id='inputEmail']
${phonenumber}          xpath://*[contains(text(),'+92')]
${country}              xpath://*[contains(text(),'India (भारत)')]
${number}               xpath://*[@id='inputPhone']  
${streetadress}         xpath://*[@id='inputAddress1']
${streetadress2}        xpath://*[@id='inputAddress2']
${city}                 xpath://*[@id='inputCity']
${country2}             xpath://*[@id='inputCountry']
${mobileno}             xpath://*[@id='customfield2']
${password}             xpath://*[@id='inputNewPassword1']
${confirmpassword}      xpath://*[@id='inputNewPassword2']
${register1}            xpath://*[contains(@class,'btn-recaptcha')]
${captcha1}             xpath://*[@class='recaptcha-checkbox-border']
         

${login}                xpath://*[@href='https://phptravels.org/login.php']
${username}             xpath://*[@id='inputEmail']
${password2}             xpath://*[@id='inputPassword']
${captcha}              xpath://body/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[4]/div[1]/div[1]/div[1]/div[1]/iframe[1]
${login1}               xpath://*[@id='login']

${shopnow}              xpath://*[@class='btn btn-default']
${installation}         xpath://*[@id='Secondary_Sidebar-Categories-Installation']
${license}              xpath://*[@id='Secondary_Sidebar-Categories-License']
${mobile}               xpath://*[@id='Secondary_Sidebar-Categories-Mobile']
${services}             xpath://*[@id='Secondary_Sidebar-Categories-Services']
${api}                  xpath://*[@id='Secondary_Sidebar-Categories-API']
${viewcart}             xpath://*[@id='Secondary_Sidebar-Actions-View_Cart']
${login2}               xpath://*[@class='btn btn-primary']
${i}                    0

${logout}               xpath://*[@id='Primary_Sidebar-Profile-Logout']

*** Test Cases ***
tc1
    
    Open Browser    ${url}     ${BROWSER}  
    Set Browser Implicit Wait        20
    Click Element   ${register}
    Input Text      ${firstname}  yes  
    Input Text      ${lastname}   boss  
    Input Text      ${email}      yesboss@gmail.com 
    Click Element   ${phonenumber}
    Execute JavaScript    window.document.evaluate("//*[contains(text(),'India (भारत)')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Click Element    ${country}
    Input Text      ${number}    9844571808
    Execute Javascript     window.scrollTo(0, 250)
    Sleep    3

    Input Text   ${streetadress}     patna
    Input Text   ${streetadress2}    patnapatna
    Input Text    ${city}    patnais
    Click Element    ${country2}
    Select From List By Label    ${country2}    India  


    Execute Javascript     window.scrollTo(250, 350)
    Sleep    4
  
    Input Text    ${mobileno}    9844571808 
    Input Password    ${password}    Yesboss123!
    Input Password    ${confirmpassword}    Yesboss123!
   
    Execute Javascript     window.scrollTo(350, 450)
    
    Sleep    3  
    #Select Checkbox     ${captcha1}
    Sleep    10
    Click Element    ${register1}
    Sleep    5


tc2
    
    Open Browser    ${url}     ${BROWSER}  
    Set Browser Implicit Wait    30
    Click Element   ${login}
    Page Should Contain    Secure Client Login
    Input Text      ${username}     ankurr@gmail.com
    Sleep    2
    Input Password    ${password2}    Pass!123      
    Execute Javascript     window.scrollTo(0, document.body.scrollHeight)
    Click Element    ${captcha}
    Sleep    10
    Click Element   ${login1}



    Sleep    2
    Page Should Contain    Choose Account
    Click Element    ${shopnow}
    Sleep    2
    Click Element    ${installation}
    Sleep    2
    Page Should Contain    Installation
    
    Click Element    ${license}
    Sleep    2
    Page Should Contain    License

    Click Element    ${mobile}
    Sleep    2
    Page Should Contain    Mobile

    Click Element    ${services}
    Sleep    2
    Page Should Contain    Services

    Click Element    ${api}
    Sleep    2
    Page Should Contain    API

    Execute Javascript     window.scrollTo(0, document.body.scrollHeight)
    Click Element    ${viewcart}
    Sleep    2
    Title Should Be    Shopping Cart   
   # Repeat Keyword    3 times    Go Back
    #Repeat Keyword    3 times    Execute Javascript    history.forward()

    Sleep    5

    Click Element    ${login2}


    

    Click Element    ${logout}
    Sleep    3
    Page Should Contain    Secure Client Login

*** Keywords ***
    
Go Forward
    Execute Javascript    history.forward()

    


    
