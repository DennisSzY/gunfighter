# 2023-group-15

## 1.Team

* **Team members**

  | Name         | E-mail                |
  | ------------ | --------------------- |
  | Xiaomeng Liu | ic22894@bristol.ac.uk |
  | Zhiyu Shi    | gc22972@bristol.ac.uk |
  | Haozhe Yang  | lf22369@bristol.ac.uk |

* **Team photo**

![groupPhoto](C:\Users\HP\Desktop\JAVAGame\2023-group-15\groupPhoto.jpg)



## 2.Introduction (5% ~250 words)

o Describe your game, what is based on, what makes it novel?

## 3. Requirements (15% ~750 words)

### 3.1 Where our game comes from?

<img src="C:\Users\HP\Desktop\JAVAGame\2023-group-15\IdeationProcess.png" alt="IdeationProcess" style="zoom: 67%;" />

[^Image 3-1]: Ideation process

* Firstly, we had a group brain-storming in class. Together, we brainstormed several games and categorized them into two types: **puzzle games and action games**. We then identified representative games for each type, such as Super Mario and Sudoku, and **analyzed their potential for secondary development and entertainment value through trial play**. The consensus was that action games were more interesting and easier to modify. 

* Therefore, we **conducted a detailed exploration of action games**, selecting Super Mario as a representative for level-based games, NS-shaft for platform games, and Gun Mayhem for shooting games to **explore innovative points**. Simultaneously, we wrote basic user stories for these three games to evaluate their implementation difficulty. 

* Ultimately, we found that **NS-shaft and Gun Mayhem** shared some common user stories. Therefore, we decided to **combine these two games** for the innovation of our game.

  ![image-20230504043635520](C:\Users\HP\Desktop\JAVAGame\2023-group-15\image-20230504043635520.png)

  [^table 3-1]: user stories for three typical game

  

### 3.2 User Stories of our game

After coming up with initial ideas, we used user stories to identify the high-level requirements for our game.

| User Stories                                                 |
| ------------------------------------------------------------ |
| “As a player, I wish to have the game screen move upwards, allowing me to continuously jump upwards.“ |
| ”As a player, I wish to have control over my orientation, enabling me to avoid falling down." |
| “As a player, I hope that my bullets can push back the enemies, allowing me to make them fall off the platform." |
| ”for two player playing together, I require the ability for two players to control the game at the same time, allowing me to play with a friend." |
| "......"                                                     |



### 3.3 Use Case diagrams

* **Use Case Diagram**

  Then we use use cases to refine our requirements and describe system behavior

![userCase](C:\Users\HP\Desktop\JAVAGame\2023-group-15\userCase.png)

[^Image 3-2]: Use Case Diagram



* **Use Case Specification**

  | Use Case Name     | Game's Home Page Display                                     |
  | ----------------- | ------------------------------------------------------------ |
  | Brief Description | The page displays when game program starts                   |
  | Basic Flow        | User choose difficulty and then start to play the game       |
  | 1.                | System displays an instruction of game operation and Image of the game character. It also shows three options to game difficulty : easy, medium and hard. And a "PLAY" button is showed on the right. |
  | 2.                | User selects the difficulty                                  |
  | 3.                | System shows a movie of the difficulty selected by the user  |
  | 4.                | User click "PLAY" button                                     |
  | 5.                | System directs user to game page                             |
  | Alternative Flows | User did not choose difficulty and start to play the game    |
  | 2.a:              | If user did not select the difficulty, system will set EASY by default. and then can go to step 4. |

  | Use Case Name     | Game In Progress                                             |
  | ----------------- | ------------------------------------------------------------ |
  | Brief Description | A process of the game  with two player                       |
  | Basic Flow        | Users operate the game character with the keyboard           |
  | 1.                | System displays two players on platforms and shows the movable platforms |
  | 2.                | Two users press their action keys to controlling the characters |
  | 3.                | System detects the action and update their status            |
  | 4.                | System detects the winner                                    |
  | Alternative Flows | Users do not operate game characters                         |
  | 2.a:              | If player is on the platform, the player will fall with the platform |
  | 2.b:              | If player is not on the platform, the player will fall down and loses life. Another player will be the winner. |

  | Use Case Name     | Game Over Page Display                                       |
  | ----------------- | ------------------------------------------------------------ |
  | Brief Description | The page displays when game is over                          |
  | Basic Flow        | User clicks restart button and return to the home page       |
  | 1.                | System displays the character of winner and shows a button of restart. |
  | 2.                | User clicks restart button                                   |
  | 3.                | System directs user to game's home page                      |


* We are not currently considering **non-functional requirements** for this game.

Upon completion of the requirement design, our game has taken shape: it requires the participation of two players, who jump onto and move around platforms to avoid falling. Players use bullets to attack each other, and being hit by a bullet will knock a player back a certain distance. Players must avoid attacks while looking for opportunities to attack their opponent, all while keeping themselves on the platforms. 



## 4.Design (15% ~750 words)

### **4.1 System Architecture**

After defining our requirements, we began our **code design**. A good design pattern can save a lot of time in structural design. We chose the mature **Model-View-Controller (MVC) design pattern**, which is commonly used in GUI-based applications. It can effectively separate modules for easy testing and task distribution, making it ideal for team game development.  Our code design was based on this model.

<img src="C:\Users\HP\Desktop\JAVAGame\2023-group-15\design pattern.png" alt="design pattern" style="zoom: 33%;" />

[^Image 4-1]: MVC design pattern; Image from：COMSM0086/Weekly Lectures/04-OXO-Briefing.pdf

### 4.2 Class Diagram



![ClassDiagram](C:\Users\HP\Desktop\JAVAGame\2023-group-15\ClassDiagram.png)

[^Image 4-2]: Class Diagram

* Firstly, we **identified three objects** in the game through requirements analysis: Player, Bullet, and Platform. They need to be displayed on the game interface, so they all must have **position information** and a **display( ) method.** They all can be movable so they all must contain some attributes about speed.The game process is also a process of updating objects' data, so they also need an **update( ) method.** Since they all have some common information, we **design a parent class** named Object so that all subclasses can inherit those common information.

* After considering  things above, it is time to fit them into the MVC model. It is evident that all these objects will be **managed by the Model class**, which will be responsible for their **generation and updating**. 
* Since our game involves keyboard and mouse interaction, the **Controller class** should include methods to response to keyboard and mouse event. The resulting updates in the object data should be r**eflected by the View class**. Finally, using the driver class to initiate those class.
* In the subsequent implementation process, we also found that a button is a special shape object that can be clicked by a mouse. Therefore, we also encapsulated it into a class called **"Shape" to manage those interactive shapes**.

* After completing things above, we started to further refine our class diagram to let our program handle more complex scenarios, such as **collision detection between Player and Bullet**, and checking whether Player is on the Platform or not. During this process, we encountered some difficulties, especially in **managing the Bullet objects**. Initially, we directly placed Bullet objects in the Model class for management. However, we later realized that since there are two players in our game, each Bullet instance should belong to a specific player. Therefore, it is more appropriate to let the Player class manage the Bullet objects, so I **added relevant methods regarding Bullet management in the Player class.**

### 4.3 Communication Diagram

When we have Objects, we need to let them collaborate to solve a problem. We chose a communication diagram instead of a sequence diagram because our overall process is relatively clear, namely initialize -> update -> display. However, the information transfer among them is not yet clear enough, and currently, our development is still in the early stages. A communication diagram can make the analysis simpler.

![CommunicationDiagram](C:\Users\HP\Desktop\JAVAGame\2023-group-15\CommunicationDiagram.png)

[^Image 4-3]: Communication Diagram



## 5.Implementation (15% ~750 words)

o Describe implementation of your game, in particular highlighting the three areas of challenge in developing your game.

\6. Evaluation (15% ~750 words)

o One qualitative evaluation (your choice)

o One quantitative evaluation (of your choice)

o Description of how code was tested.

## 7. Process (15% ~750 words)

o Teamwork. How did you work together, what tools did you use. Did you have team roles? Reflection on how you worked together.

### 7.1 模型的选择

我们选择了Agile 因为我们的模型有什么....

### 7.2 

 



## 8.Conclusion (10% ~500 words)

o Reflect on project as a whole. Lessons learned. Reflect on challenges. Future work.

**未来还可以考虑一些非功能需求-比如响应得更快，优化算法，以获得更好的游戏体验。**

· Quality of report writing, presentation, use of figures and visual material (5%)

· Documentation of code (5%)

## Individual contribution. 

Provide a table of everyone's contribution, which may be used to weight individual grades. We expect that the contribution will be split evenly across team-members in most cases. Let us know as soon as possible if there are any issues with teamwork as soon as they are apparent.

| Name         | Individual Weight |
| ------------ | ----------------- |
| Zhiyu Shi    | 1.1               |
| Haozhe Yang  | 0.8               |
| Xiaomeng Liu | 1.1               |

