# ClubHub

**ClubHub: An app that allows students to view clubs on campus and assists students in starting new clubs.**  

**Backend Repo**
https://github.com/rafaelvchaves/ClubHub-Backend 

**Screenshots of the app** 
 ![Login Screen](https://github.com/rochellekris/ClubHub/blob/master/screenshots/Login.png)
 
 ![Clubs Screen](https://github.com/rochellekris/ClubHub/blob/master/screenshots/Clubs.png)
 
 ![Posts Screen](https://github.com/rochellekris/ClubHub/blob/master/screenshots/Posts.png)
 
**Description**:
ClubHub serves to organize clubs on campus by allowing students to filter clubs by categories. The “Post” feature allows students to post ideas about new clubs and assists in creating groups for collaboration in starting new clubs.  

**Requirements**:

iOS: 

NSLayoutConstraint- to organize the buttons in the filter screen we used NSLayoutConstraint; UICollectionView- used to display all clubs; Navigation- used to go from home to filter screen, and also to the post or profile screens and back to home; integration with API- provided details on clubs

Backend: 

Google Cloud VM: http://35.237.207.25/
Models: Clubs, Users, and Posts
GET requests include getting all clubs/posts (with URL parameters for full-text search and for filters), getting one club/post/user, getting all users
POST/PUT requests include creating a club/post, registering an account, logging in a user, updating session tokens, adding a club/post to a user's favorite list, removing a club/post from a user's favorite list
DELETE requests include deleting a club, user, and post.

**Additional Notes**:
The club data was collected by parsing the registered student organizations pdf from the Cornell website (https://ccengagement.cornell.edu/sites/ccengagement.cornell.edu/files/sleca/documents/Organizations_2018-19.pdf)
Then, we used a few Python packages to look through the web and gather necessary data that we could find for each club. Finally, all of that data was extracted into a json file, which was then loaded up into the database.
