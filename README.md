# TheFinalestProjectEver

## Project Description

This game attempts to recreate the classic arcade Pac-Man game. The user uses arrow keys to guide Pac-Man through a maze to eat Pac-Dots, while avoiding the ghosts roaming around the maze. If Pac-Man touches a ghost, the user loses a life and when all lives are lost, the game is over. In order to win the game, the Pac-Man must eat all the Dots. To create this game, we used a series of nodes to represent the tunnels and the intersections that Pac-Man can travel through. 

## Project Features

**1. The Map File**

The blueprint of the map that will be used in the game will be located in a text file titled "Map.txt". The file will contain letters that symbolizes what should be created. The map will always have a width of 32 and height of 18.
- P: Pac-Man
- N: Nodes (spots where Pac-Man can move on)
- D: Dots that can be consumed by Pac-Man to generate points for the player
- G: Ghosts

**2. Valid Map Check**

The game automatically checks if the Map.txt file contains a valid map. The map must follow the dimension guidelines (width of 32 and a height of 18) and contain the characters to represent Pac-Man, Nodes, Dots, and Ghosts. There must be exaclty one Pac-Man and at least one empty Node or Ghost. In addition, the program does not allow oversized maps and the Map.txt file may not contain any more than 18 lines (this is a strict requirement!).

**3. Node Data Structure**

This project utilized a Node-based data structure to build out a maze and control interactions among PacMan, the Dots, and the Ghosts.

**4. Game Difficulty**

The user chooses from three different difficulty levels (easy, medium, and hard). When the difficulty is set to easy, the Ghosts move at half the normal speed of Pac-Man. When the difficulty is medium, the ghosts move at Pac-Man's speed. When the difficulty is hard, the ghosts move at double Pac-Man's speed.

In addition to allowing the user to select the level of difficulty, the movement of Pac-Man makes the game more difficult. When Pac-Man eats a Dot, he slows down, making him vulnerable to taking damage from Ghosts. 

**5. User Interface**

The program features a start screen, game over screen, and a win screen. To improve user experience, the player is able to pause the game in order to restart. Directions on how to interact with the program are displayed so the user has no difficulty in navigating the program.

## How to Run Program

1. Clone into repo
2. Open Launcher.pde in Processing
3. Run the program
4. Select difficulty level (easy, medium, or hard) using the mouse
5. Press spacebar to start game
6. Use the following controls
      - Esc: Exit program
      - P: Pause
      - W: Up
      - S: Down
      - A: Left
      - D: Right


## Development Log


### DAY 1 - May 16, 2019
**Christy**
- During this in class work period, I created the PacMan file and wrote the skeleton for the methods to be completed. I also created the outline for the README file so that we can easily update it later.

**Jason**
- During this work period, I copied over the node class from last semester and started work on the Maze class.



### DAY 2 - May 18, 2019 to May 19, 2019
**Christy**
- I worked on the PacMan and Ghost classes. I wrote the methods to load the images in and display the images, but I will need to update it later once we move from Java files to Processing. I also found PNG files for PacMan and the four ghosts. Lastly, I worked a little bit on the Maze class and wrote the constructor and the method to add a Node in each of the four directions.

**Jason**
- I created the Dot class and also a launcher which will start up the game. I used scanner to attempt to create a map that can be displayed in processing. I created a test text file with special letters that symbolize what should be at the respective locations. I also started to work on the directions, specifically adding what each letter in the text file map symbolizes.



### DAY 3 - May 20, 2019
**Christy**
- In class, I wrote the move and eat methods for Pacman and I also had to add extra methods to the Node class for this to work. I had a lot of trouble with merging branches, so I spent most of the class time trying to resolve the problems. I was unable to fix it, so at home, I had to delete the branch I was working in and rewrite the methods I was working on. 

**Jason**
- In class, after looking up how to handle files in processing, I switched out the scanner in the launcher class for the loadString function to avoid dealing with exceptions. I also updated the Node class so that each node gets four links (up, down, left, and right) instead of just two (previous and next). At home, I finished reading and laying out the nodes, dots, Pacman, and ghosts. Still need to work on connecting them.



### DAY 4 - May 21, 2019
**Christy**
- During class time, I worked on methods for Ghost movement. I got the random movement of the Ghost, but I will need to work on writing a method where the Ghost chases PacMan once it is close enough. At home, I started working on the visuals of loading and displaying the different images. I also created 4 images of Pacman in the four directions.

**Jason**
- During the day, I made some changes to the constructors of all the classes. I also finished drafting the code for the layout of the map, dots, and entities. I should probably begin testing now that all the classes are in processing format and inside the "Launcher" directory.



### DAY 5 - May 22, 2019
**Christy**
- During class, I worked on experimenting with the visuals of the program. I learned how to use keyboard input in order to move an object around the screen. I also made copies of the Node and Dot classes in an attempt to display them. At home, I successfully created several Nodes and linked them together into a maze and displayed the Dot classes. However, when I tried to separate the classes into different tabs, I ran into a lot of errors with Processing and I wasted a lot of time with this. I will have to make a new sketch tomorrow and copy over any progress I made today.

**Jason**
- Using loadStrings created a lot of problematic scenarios, such as when being presented with a map with varying row lengths and even empty rows. Spent a lot of time debugging the launcher and the Maze class. After testing a bunch, I am fairly certain that any map can be displayed as long as it has a width of 32 and a height of 18. I would like to be flexible with the map dimensions but the user might create a map with an unreasonable width, height, or both.



### DAY 6 - May 23, 2019
**Jason**
- I've made dots displayable. I made two interfaces: Displayable and Moveable. I thought that would spice things up a little bit. I had to add a display method and fields for the coordinates in Dot and Node because I realized that it was probably better to use just display in the launcher and do all the coordinate stuff in the classes. Yikes.



### DAY 7 - May 24, 2019
**Jason**
- What can I say? Everything is now displayable. Movement for Pac-Man is next.

**Christy**
- Worked on text display in the experiments folder. I experimented with different ways to update a counter. I ended up with a solution that didnt require clearing the whole screen. This text display will be used for points and lives counter



### DAY 8 - May 25, 2019 to May 27, 2019
**Christy**
- I worked on the visual movement of PacMan in a separate branch. I got PacMan to move up when you press W, but it doesn't work when you press another key. This was challenging to figure out because although the print messages I used for debugging showed that PacMan was moving around properly (the coordinates changed when you pressed the keys), you could not visually see it on the screen. 

**Jason**
- Finished controlled movement. The Pac-Man can move and will consume dots once he steps on them. Issues with ghosts.



### DAY 9 - May 28, 2019
**Christy**
- In class, I added a point counter that displays how many dots PacMan has eaten. I referenced experimental code that I had before that tested out a counter that increased every time a key was pressed. At home, I added a lives counter and a "game over" screen. I also loaded the 4 images of PacMan once in the setup, rather than loading the image each time PacMan changes direction in order to stop the game from freezing.

**Jason**
- Placed limits on both the movement for Pac-Man and the movement of ghosts.



### DAY 10 - May 29, 2019
**Christy**
- In class, I made a "game over" screen that stops the game when PacMan loses all of his lives. I also continued working on PacMan damage so that he would lose a life if he was standing still and not only if a key (W,A,S,D) was pressed. Lastly, I moved the code for displaying the text into another method for code readability.

**Jason**
- I fixed the "blinking" problem for the ghosts by creating a new ArrayList separate from thingsToDisplay. This new ArrayList is only for ghosts and the objects inside are displayed before Pac-Man but after everything else. This ensures that ghosts will always be drawn on top of the nodes. I also moved loadImage calls into the constructors of the respective classes, but this doesn't really affect the speed of the program.



### DAY 11 - May 30, 2019
**Christy**
- In class, I worked on creating a start screen. I am displaying an image for the start screen and the user presses the space key to start the game. At home, I created a game over screen that shows up when PacMan has lost all three lives. I also started adding comments to the code to explain what it does.

**Jason** 
- I added comments and sorted the code. I also removed some useless methods, most of which were accessor methods with fields that can be accessed directly. I added a pause function as well.



### DAY 12 - May 31, 2019
**Christy**
- In class, Mr. K gave suggestions on how to improve the game beyond the MVP. Some of these suggestions include better visuals (smooth gliding movement of PacMan and the Ghosts), different Ghost behavior (chasing PacMan from different directions), and resizing the screen so that the game is not full screen. I began to attempt to work on the smooth gliding motion of PacMan. I also updated the README with instructions on how to run the program.

**Jason**
- I centered some of the text (but that doesn't really matter because I did resizing afterwards so they have to be centered again). I added a way to win the game as well as a victory screen (this hasn't been tested yet because I haven't won a game yet). I also fixed an issue with displaying points and lives by moving the background call and deleting some lines of code. I changed the type for the coordinates from int to float to allow for more flexibility.



### DAY 13 - June 1, 2019 to June 4, 2019
**Jason**
- I made some final changes to the project that included improving user interface by changing the start, pause, end, and win screens. I also smoothed out the movements of the ghosts and Pac-Man. Some changes could not be implemented because it would slow down the program to an unacceptable degree (calculating all the distances for the chase function of the ghosts and the if statements that come with adding too many buttons to the start screen and screens). I also added a replay function and difficulty selection to control ghost speed (meant to make up for the fact that they don't chase you).

**Christy**
- I added comments to all the classes and updated the README with a more detailed project description, more project features, and specific instructions on how to run the program.
