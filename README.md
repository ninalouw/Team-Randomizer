# Team-Randomizer

##Instructions

Write a Sinatra app that allows the user to enter a list of names separated by commas and enter the number of teams. Upon hitting "submit" the app should display teams with random members in each of even numbers. If the total number of names to choose from is odd, one team may have one fewer member.

Sample app [here:](http://sinatra-apps.herokuapp.com/team_picker)

Note: Do this assignment with another person and ask a TA to code review it and mark it as complete for you. You must put the code on Github.

*Stretch 1:* add validation so if the number of teams is bigger than the number of members, it shows an error message.

*Stretch 2:* store the member names and number of team in the session so if the user revisits the information will still be display on the page.

*Stretch 3:* make the app support selecting either the number of teams of the number of members per team as per the sample app above.

##Strengths

The app works well and sorts names randomly into teams. You can also choose number of people per team and number of teams.
I used Bootstrap and some button and banner message CSS styling to make the page look nice.

##Improvements

The app displays two different error messages if you enter too few names versus the number of people per team or number of teams that you select.
I need to add more error checking so that an error message will be displayed if the user enters bad input (for example letters rather than a number) rather than bad input resulting in a Sinatra error message.
