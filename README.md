# The_Great_Adventure

WHAT THIS WEBSITE DOES:

This website is an application that supports a big scavenger hunt around the world. The idea is that at different locations around the world there would be hidden devices receiving codes that change regularly. If the code that appears on the device is submitted to the application at the right time in the process of the scavenger hunt, you get the enigma that leads you to the next location, until you find the treasure.

I chose to do this for the coding challenge because it is something I would enjoy participating in. Also, if I happen to be rich when I am older, some of my estate will be the treasure of a big treasure hunt so starting on the app supporting this project might be useful for my future. Furthermore this has app some similarities with the app I would be working on at Awake labs.

The web app works in the following way so far:<br/>
  --> When you arrive on the home page you can click the sign up or sign in buttons which lead you to thier respective pages. <br/>
  --> Once on the sign up page you can fill in the form and become an adventurer if you haven't used this email to sign up before.<br/>
  --> If you are signed up you can log in on the sign in page (by using the informatioin you've signed up with).<br/>
  --> If you have logged in successfuly you arrive on a new page where you are asked to insert a code and a location, which if correct leads you to an enigma.<br/>
  --> On this enigma page, if you answer correctly to the problem you get a CORRECT message and an INCORRECT message if wrong.<br/>

THE TRICKIEST PROBLEM ENCOUNTERED:

As a general rule, to troubleshoot, I would make small changes to the code or print texts in the comsole depending on which parts of the program executed and see what changed or appeared as a result. From there, I would deduce where the problem was comming from. I would also google error messages or unexpected behavior.<br/>
The trickiest problem I encountered was that I wasnt able to render an html file propertly when pressed on a button.
--> The tricky part was that I made the mistake in the Javascript file associated with the button and the server didn't update the changes that where made to the file when I had saved the modification to the file on my computer. After some thourough googling I deleted the cashed files and the updated javascript file was the one exectued and everything worked.

FURTHER IMPROOVEMENTS:

If (and when) I have more time, I will do the following:<br/>

--> have a way of knowing when the user is connected to pass on the user id to the MySQL stored procedures without the user inputting anything <br/>
--> pass on the enigma id in a similar way <br/>
--> make the website more secured ( find a way to have a hashed password without it being too long to store in the database) <br/>
--> find all the enigmas I will use, with associated hints and locations and put them in the enigmas table <br/>
--> 

... More Generally ...:
--> have a riddle show up every day, if you answer it correctly, you get a jewel. (you only get 1 chance) <br/>
--> if you have 8 jewels you can unlock a hint (there is 1 hint per enigma). <br/>
--> change the enigma codes regularly and comunicate them to a device <br/>
--> the adventurers can post pictures of thier travel and enter a contest to win a prize <br/>
--> a funding button where people can support the project (i dont want to put commercials on the website but I woudl like an income) <br/>
--> a ranking system that show who is closer to the treasure <br/>
--> make the website beautiful <br/>
--> make the code beautiful <br/>


There are some pictures that show what the website displays at /FlaskApp/pictures.


Since web development is new to me, this tutorial helped me a lot and I based my code off of it:
http://code.tutsplus.com/tutorials/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-22972

I have learned a lot this weekend and will continue to learn how to develop web applications this summer! 


