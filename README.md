# 2023-group-15

o Team members: Xiaomeng Liu, Vishwesh Neelesh, Zhiyu Shi, Haozhe Yang

o Team photo:

o paper prototype video (Gun Fighter):    

https://user-images.githubusercontent.com/104490863/218481532-f9649fc1-3a84-42b5-9792-aba5c6374f9f.mp4


o Game reference website:

https://www.crazygames.com/game/gun-mayhem-2

https://www.youtube.com/watch?v=-SksNwLmSSE&ab_channel=TheRarestGamer

## Implementation 

Our game code adheres to a Simplified Model-View-Controller (MVC) architecture. The Controller class is responsible for handling user input, the Model class stores the central data of the system, and the View class displays views. The Player, Platform, and Bullet classes incorporate individual variables and functions, while the Shape class and Rectangle class define the field binding with mouse Clicked events.

In shoot-em-up games, the two-player mode is an essential feature. To implement this mode, we instantiate two Player class objects, where each object is associated with a unique control key. To differentiate between the two players, we introduce a special attribute for each player instance, specifically bluePlayer (id=1) and redPlayer (id=2). This facilitates the mouse click event binding with different id attributes for players.

<img width="425" alt="截屏2023-05-03 17 18 16" src="https://user-images.githubusercontent.com/104490863/236041774-ea8dadb0-cd5f-408b-85d5-a629e1138dfb.png">

The implementation of our code encountered three primary challenges:

### 1: produce the platform randomly

Firstly, the generation of platforms in a random manner. The platforms descend at a specific rate, which is determined by the game's difficulty level. The horizontal position of the platforms is also randomly determined.

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
