# The_Great_Adventure


This website is an application that supports a big scavenger hunt around the world. The idea is that at different locations around the world there would be devices receiving codes that change regularly. If the code that appears on the device is submitted to the application at the right time in the process of the scavenger hunt, you get the enigma that leads you to the next location until you find the treasure.

I chose to do this for the coding challenge because it is something I would enjoy participating in. Also, if I happen to be rich when I am older, some of my estate will be the treasure of a big treasure hunt so starting on the app supporting this project might be useful for my future. Furthermore this has app some similarities with the app I would be working on at Awake labs.

The web app works in the following way so far:
  --> When you arrive on the home page you can click the sign up or sign in buttons which lead you to thier respective pages.
  --> Once on the sign up page you can fill in the form and become an adventurer if you haven't used this email to sign up before.
  --> If you are signed up you can log in on the sign in page (by using the informatioin you've signed up with).
  --> If you have logged in successfuly you arrive on a new page where you are asked to insert a code and a location, which if correct leads you to an enigma.
  --> On this enigma page, if you answer correctly to the problem you get a CORRECT message and an INCORRECT message if wrong.


The trickiest problem I encountered was that I wasnt able to render an html file propertly when pressed on a button.
As a general rule, to troubleshoot, I would make small changes to the code or print texts in the comsole depending on which parts of the program executed and see what changed or appeared as a result. From there, I would deduce where the problem was comming from. I would also google error messages or unexpected behavior.
--> However, here I had made a mistake in the Javascript file associated with the button and the server didn't update the changes that where made to the file when I had saved the modification to the file on my computer. After some thourough googling I deleted the cashed files and the updated javascript file was the one exectued and everything worked.


If (and when) I have more time, I will do the following:

--> have a way of knowing when the user is connected to pass on the user id to the MySQL stored procedures without the user inputting anything,
--> pass on the enigma id in a similar way.
--> make the website more secured ( find a way to have a hashed password without it being too long to store in the database)
--> find all the enigmas I will use with associated hints and locations and put them in the enigmas table
--> 



