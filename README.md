# Comic Time

Comic Time is a app that will help you when you feel bored or when you sit on the train and you want a different form of entertainment like reading some fun and clever comics from xkcd.

The app at the moment is a MVP and it have some features to get an ideea of what the app is about.

For this app i used Swift/SwiftUI

First when you open the app a welcome screen will appear and a button. When u press the button you will get in the app.
On the screen it will load the "current comic" and  that means that is the last comic added. For that i used the API and a fetch data function located in the ModelView. On the main screen at the top there is a search bar and the user can search by comic number. To do that the input value is injected in the API link.

Under the search bar there is a scroll view that contains some info about the comic and a Link that will redirect you to Safari to view that specific comic explanation. The link is changhing the adress based on the comic number.
  Under the image is the comic text 
 
 I was thinking that it will be fun to have a random function because the serach by name on the xkcd site did not work.
 So for that there is a button at the bottom of the page that will get a random comic. For that i used a random function that will pick a comic number between 1 and the last added comic number.
 I did not get into Core Data to save favorites for offline view but i think that it wold have been the next step.
 
 Thank you and I hope you enjoy this simple app
 
 
 






