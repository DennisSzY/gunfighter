# 2023-group-15

o Team members: Xiaomeng Liu, Vishwesh Neelesh, Zhiyu Shi, Haozhe Yang

o Team photo:

o paper prototype video (Gun Fighter):    

https://user-images.githubusercontent.com/104490863/218481532-f9649fc1-3a84-42b5-9792-aba5c6374f9f.mp4


o Game reference website:

https://www.crazygames.com/game/gun-mayhem-2

https://www.youtube.com/watch?v=-SksNwLmSSE&ab_channel=TheRarestGamer

## Introduction

Our game idea comes from gun-mayhem and NS-shaft platform game in which you can fight with your friends. The aim of this game is simple, you need to keep jumping between different platforms which will be randomly generated and you must knock your opponent off of the arena using your weapons. This might seem easy, but it can prove quite difficult to knock your opponent off completely without getting hit yourself!

In the game we have several levels from easy to hard.In the easy mode, the platform will be falling very slow and your weapon will be weak and harmless,it is the mode suitable for novice and the people who first play this game. You can enjoy a relaxing and enjoyable leisure time with your friends.When you and your friends are familiar with the operation Instructions of this game, you can try medium mode. In medium mode the platform will not be that easy to jump to stand because it will be fallen faster. You need to be more focused on the game and be care of the bullets coming from your friends. In the hard mode, the platform will be fallen super faster and the speed of your bullet will be faster too. Which means you will be easily killed both by shooting and platforms falling. This game needs you to have good operation ability and psychological quality, try to use skills and tactics to beat your friends!

## Implementation 

Our game code adheres to a Simplified Model-View-Controller (MVC) architecture. The Controller class is responsible for handling user input, the Model class stores the central data of the system, and the View class displays views. The Player, Platform, and Bullet classes incorporate individual variables and functions, while the Shape class and Rectangle class define the field binding with mouse Clicked events.

In shoot-em-up games, the two-player mode is an essential feature. To implement this mode, we instantiate two Player class objects, where each object is associated with a unique control key. To differentiate between the two players, we introduce a special attribute for each player instance, specifically bluePlayer (id=1) and redPlayer (id=2). This facilitates the mouse click event binding with different id attributes for players.

<img width="425" alt="截屏2023-05-03 17 18 16" src="https://user-images.githubusercontent.com/104490863/236041774-ea8dadb0-cd5f-408b-85d5-a629e1138dfb.png">

The implementation of our code encountered three primary challenges:

### 1: produce the platform randomly

Firstly, the generation of platforms in a random manner. The platforms descend at a specific rate, which is determined by the game's difficulty level. The horizontal position of the platforms is also randomly determined.

![easy](https://user-images.githubusercontent.com/104490863/236059295-8238cf56-fcbd-48dc-9100-36a96c3574b4.gif)

It is worth noting that the game begins with a pre-generated set of platforms to provide the player with a starting point for landing. The randomly generated platforms should be positioned within the interface and unobstructed to allow for unhindered jumping.
To generate the platforms at fixed intervals, we use the following code: 

`If(millis() - lastPlatformProduceTime > platformProduceInterval){//produce the platform}`


However, the platform produce interval must change according to the game's difficulty level to alter the speed at which the platforms descend. If the interval remains constant, the vertical distance between the platforms will change, but the height of the player's jump will remain constant, leading to gameplay disruptions.

To store all platforms, we use an ArrayList. As platforms move out of the interface, they are removed from the ArrayList promptly to prevent OutOfMemoryError from crashing the program.

### 2: Acceleration 

In order to create a realistic virtual environment, it is essential to consider the effects of gravity and acceleration on player movements. The incorporation of these effects is achieved by introducing specific attributes in the Player class. Specifically, the gravity attribute is implemented to simulate the gravitational effect on jumping. Upon pressing the designated keyboard key to initiate a jump, the player is endowed with an initial upward velocity. However, the upward velocity gradually decreases over time due to the influence of gravity, leading to a transition to a downward velocity.

In addition, the Player class is also equipped with a horizontal acceleration attribute to simulate the effect of acceleration when the player is hit by a bullet and moves horizontally. As time progresses, the player's lateral movement speed increases. Nonetheless, there is a limit to the maximum horizontal speed that can be attained by the player, rendering the acceleration effect finite in nature.

### 3:Collision Detection

In our game, collision detection is essential for two scenarios: detecting if the player is standing on a platform and detecting if the player is hit by an opponent's bullet. To detect if the player is standing on a platform, we traverse all the platforms stored in the ArrayList and check whether the player rectangle intersects with any platform. This check is performed using the conditional statement:

`if (y + h >= platformY && y < platformY + platformHeight && x + w - 10 > platformX && x + 10 < platformX + platformWidth)`

Here, the first condition "y + h >= platformY" ensures that the player rectangle is below or partially overlapping with the platform. The second condition "y < platformY + platformHeight" ensures that the player rectangle is above or partially overlapping with the platform. The third condition "x + w - 10 > platformX" ensures that the player rectangle is to the left or partially overlapping with the platform. Finally, the fourth condition "x + 10 < platformX + platformWidth" ensures that the player rectangle is to the right or partially overlapping with the platform.

For detecting if the player is hit by an opponent's bullet, we first check if the bullet's moveSpeed is greater than 0 (which implies that the bullet is moving to the right). If so, we check whether the bottom edge of the player rectangle (y + h) is below the top edge of the bullet (bullet.y + bullet.h), whether the top edge of the player rectangle (y) is above the top edge of the bullet (bullet.y), and whether the right edge of the player rectangle (x) is to the left of the right edge of the bullet (bullet.x + bullet.w). If these conditions are satisfied, then the player rectangle has collided with the bullet, and the code sets the "isShooted" flag to true, sets the "facingRight" flag to false, and removes the bullet from the "firedBullets" list.

If the bullet's moveSpeed is not greater than 0, then we assume that the bullet is moving to the left. In this case, we check whether the bottom edge of the player rectangle (y + h) is below the top edge of the bullet (bullet.y + bullet.h), whether the top edge of the player rectangle (y) is above the top edge of the bullet (bullet.y), and whether the left edge of the player rectangle (x + w) is to the right of the left edge of the bullet (bullet.x). If these conditions are satisfied, then the player rectangle has collided with the bullet, and the code sets the "isShooted" flag to true, sets the "facingRight" flag to true, and removes the bullet from the "firedBullets" list. It is crucial to remove the bullets that hit the player from the ArrayList; otherwise, the player will keep getting hit by the same bullets.

## Evaluation

### 1.Qualitative evaluation:

For evaluating our game design. We decided to use Think Aloud evaluation method to conduct qualitative testing of the game. And several test users are invited to explore and play our game freely with or without our guidance. And we asked them to thoughs aloud to express their experience.

We have found some problems during the test.e.g. The guidance at the beginning of the game is too vague, many players can't find the jump and shoot buttons correctly when playing the game for the first time; And the difficulty design have some problems, for example, the gap between the platforms sometimes too large so that players cannot jump up no matter the player try how hard.

To solve those problems, we improved our guidelines and adjusted our hardness settings. We need to strike a balance between playable and difficulty of the game.

One bug we found during the playing is that as the game’s setting, when a player fires a bullet at another player, the player who is hit is supposed to step back, but sometimes, especially when the player who is hit is moving towards the player who fired the bullet. The hit player will move in the direction of the firing bullet. To solve this problem, we adjusted many parameters like the bullets speed, bullets length, and the player’s length. Finally we found that the problems comes because of lowness of the screen refresh rate. Some times when the screen detected the collision between players with the bullets, the bullets have already moved across the player. So we adjusted the function of the collision and shorted the body of the bullets

### 2.Quantitative evaluation

In order to gain more data to improve our game. We added some instructions and solved some bugs and problems happened before. Then we invited more people to experience the game and asked them to fill the NASA TLX and System Usability Scale forms after their experience.We have six dimension to evaluate players cognitive and psychological load during the game playing in different difficulties.

The content of NSA TLX have six dimension. In the first mental demand , we asked:

1.How quickly does the game's platforming disappear?

2.How much attention does the player need to dodge enemy attacks?

3.How much decision making is required during the game?

In the second physical demand , we asked:
1.How much hand-eye coordination does the player need to shoot the enemy?

2.How much time is needed to move and dodge attacks?

3.How much power does the player need to use to control the game?

In the third temporal demand , we asked:
1.How long does it take players to complete tasks in the game?

2.Does the game move too fast or too slow?

3.Does the player have enough time to think and make decisions?

In the fourth performance demand , we asked:
1.Are players satisfied with their performance in the game?

2.What is the player's assessment of his or her skill level?

3.How is the player's emotional experience in the game?

In the fifth part effort , we asked:
1.How much effort does the player need to make to control the character in the game?

2.How much effort does the player need to stay alert and focused?

3.How much effort does the player need to remember the mission objectives and how the enemies attack?

In the sixth part frustration , we asked:
1.How difficult are the tasks required in the game?

2.How many different tasks are there to complete?

3.Does the difficulty of the tasks match the skill level of the player?

We asked same questions for different people who was playing different difficulty levels. It can be easily found that the pressure get higher along with the harder mode. We found that in the hard mode people generally feeling unsatisfied about their performance, which means the game was too hard to play and the player cannot be satisfied during the game. 

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/104490863/236066286-ae9957ed-a562-4c78-8916-6b5be9b19104.png">

We have ten questions of SUS writing below:
1.I found the game very easy to pick up.

2.I had a smooth action in the game.

3.I felt that the weapons and props in the game worked well.

4.I found the objectives and missions in the game to be clear.

5.I found the enemies and mechanics in the game challenging.

6.I thought the graphics and sound effects were cool.

7.I found the scenery and backgrounds in the game attractive.

8.I found the story and storyline in the game interesting.

9.I found the difficulty settings in the game to be appropriate.

10.I found the gameplay in the game interesting.

Through the SUS graph we can see that players did not give us a very good satisfactory scores. There are some aspects we still needs to improve to make the user to feel easy to use and understand. And some game backgrounds needs to be added to make our story looks easy to understand.

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/104490863/236066503-b3d64224-9494-4ed5-ac87-b26e9faefbe2.png">

## How code was tested：

As we are using processing as our platform. We did not provide any testing code to run our game.We mainly focused on user testing like Think Aloud evaluation, NASA TLX and System Usability Survey (SUS) methods. 

The Think Aloud evaluation methods mainly focused on debug and to find out some unreasonable part during the gameplay. And it worked well in checking our outline guidance whether clear or not too. It really helped us make a game that has good interaction and is quick and easy to play.

Based on the result of the questionnaire, we can conclude that our game have a very nice special effects which attracts the players most. Combined with the good audio effects, the overall experience is very good. After the Think Aloud evaluation methods we redesigned our interface which have become simple and clear. Some drawbacks of our game is quite clear like etc. the lack of diversity in the range of weapons, needs more kinds of roles and maps to choose. We want but we did not have enough time to accomplish so many functions in that short time.
