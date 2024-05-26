# ArcadeFunWeb
A game hosting website, allowing people to "buy" then download and play games 

Before I start with the instructions for uploading the site on your computer, you must make sure that your computer has
The software Microsoft Visual Studio 2015.
After installing the software on your computer, you can upload the site according to the following steps:

1. Copy the folder "website" to your computer. Make sure you copy the folder to some drive and then continue with the instructions.
3. Open the wsgames folder as a website using Microsoft Visual Studio 2015.
4. Run through the Service (server) named Service.cs, and after running click on the service description option.
5. Copy the URL that appears in the address bar of the browser.
6. Now open another window of the software Microsoft Visual Studio 2015, and open the folder 777_329488837. Be sure to keep the server's web window open at all times, so that the server works properly.
7. Before running the project, the Web References must be reconfigured, so that the Proxy component can work properly with the Web Service. Therefore, first, delete the existing App_WebReference, and then create a new one by right-clicking on the world logo, clicking add, and then ServiceReference.
8. In the same window, in the URL line, put the URL we copied earlier from the server (section 4) and press GO.
9. Go to the User folder to the "Home.aspx" page, click on the code, and then run (ctrl+f5).

To log in as a (regular) registered user on the website, fill in the following details in LogIn.aspx:
Username: aa
Password: aa

To log in as the site administrator, fill in the following details in AdminLogin.aspx:
Username: aa
Password: aa
