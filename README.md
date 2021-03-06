# The_Great_Adventure

WHAT THIS WEBSITE DOES:

This website is an application that supports a big scavenger hunt around the world. The idea is that at different locations around the world there would be hidden devices receiving codes that change regularly. If the code that appears on the device is submitted to the application at the right time in the process of the scavenger hunt, you get the enigma that leads you to the next location, until you find the treasure.

I chose to do this for the coding challenge because it is something I would enjoy participating in. Also, if I happen to be rich when I am older, some of my estate will be the treasure of a big scavenger hunt so starting on the app supporting this project might be useful for my future. Furthermore this has app some similarities with the app I would be working on at Awake labs.

The web app works in the following way so far:<br/>
  --> When you arrive on the home page you can click the sign up or sign in buttons which lead you to their respective pages. <br/>
  --> Once on the sign up page you can fill in the form and become an adventurer if you haven't used this email to sign up before.<br/>
  --> If you are signed up you can log in on the sign in page (by using the information you've signed up with).<br/>
  --> If you have logged in successfully you arrive on a new page where you are asked to insert a code and a location, which if correct leads you to an enigma.<br/>
  --> On this enigma page, if you answer correctly to the problem you get a CORRECT message and an INCORRECT message if wrong.<br/>

THE TRICKIEST PROBLEM ENCOUNTERED:

As a general rule, to troubleshoot, I would make small changes to the code or print texts in the console depending on which parts of the program executed and then see what changed or appeared as a result. From there, I would deduce where the problem was coming from. I would also google error messages or unexpected behavior.<br/>
The trickiest problem I encountered was that I wasn't able to render an html file properly when a button was pressed due to incorrect code in the JavaScript file. <br/>
--> The tricky part was that the server didn't update the changes that were made to the JavaScript file when I had saved the modification to the file on my computer. So I couldn't deduce where the problem was coming from at first. After some thorough googling I deleted the cached files and the updated JavaScript file was the one executed and everything worked.

FURTHER IMPROOVEMENTS:

If (and when) I have more time, I will do the following :<br/>

--> have a way of knowing when the user is connected to pass on the user id to the MySQL stored procedures without the user inputting anything <br/>
--> pass on the enigma id in a similar way <br/>
--> make the website more secured ( find a way to have a hashed password without it being too long to store in the database) <br/>
--> find all the enigmas I will use, with associated hints and locations and put them in the enigmas table <br/>
--> change the SQL query to make the getEnigma procedure apply to all the enigmas not just the one with id = 2 <br/>
--> make all the buttons do what they are supposed to

... More generally ...: <br/>
--> have a riddle show up every day, if you answer it correctly, you get a jewel. (you only get 1 chance) <br/>
--> if you have 8 jewels you can unlock a hint (there is 1 hint per enigma). <br/>
--> change the enigma codes regularly and communicate them to a device <br/>
--> the adventurers can post pictures of their travel and enter a contest to win a prize <br/>
--> a funding button where people can support the project (I don’t want to put commercials on the website but I would like an income) <br/>
--> a ranking system that show who is closer to the treasure <br/>
--> make the website beautiful <br/>
--> make the code beautiful <br/>...


There are some pictures that show what the website displays at /FlaskApp/pictures.


Since web development is new to me, this tutorial helped me a lot get started and I based part of my code off of it:
http://code.tutsplus.com/tutorials/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-22972

I have learned a lot this weekend and will continue to learn how to develop web applications this summer! 

