# CatClicker - README WORK IN PROGRESS
**CatClicker** is a simple game where you -the player- gain love points for your cat through either random loot, or by manually clicking on the cat. Not unlike [Cookie Clicker ](https://en.wikipedia.org/wiki/Cookie_Clicker) in certain aspects. 

**Table of Contents**
* [App Concept](https://github.com/s028214/CatClicker/blob/main/README.md#app-concept) - Concept, explanation and gameplay
* Developement - Code documentation
* System Requirement - Needed hardware/software
* Quick Start - xCode and iOS deployment 


## App Concept
Gain as many points as possible for Filipe (or whatever you call the lil car), the Cat! 
Run down of frontend UI + game explanation.

*Note: "love" points can also be described as ❤️ point

**Points counter -** <br>
Similarly to cookie clicker, you are able to gain or lose ❤️: # <br>
In the app, it'll be displayed in terms of a percentage on the top of your device. <br>
<img width="176" alt="Screenshot 2024-11-08 at 9 32 24 AM" src="https://github.com/user-attachments/assets/93dcc814-8f8c-4ec2-a5be-af92579e6910"> <br>
Each 10 "love" points is calcualted as 1%. 


**Clicky cat-** <br> 
By default, you can click on the cat to gain 1 ❤️ point. Background white. <br> 
<img width="208" alt="Screenshot 2024-11-08 at 9 44 08 AM" src="https://github.com/user-attachments/assets/9b47c0a4-190c-4cc0-9c03-ddfba1ae6a73"> <br> 

During doubleUp, you'll gain 2 ❤️ points per click until it disables - will set back to default. Background yellow. <br> 
<img src="https://github.com/user-attachments/assets/137c56cc-4ade-4e45-b0c8-7b646380707d" width="210" height="210" alt="clicky"> <br>

**Action** <br>
An array of a 3x2 (across and down) with hidden values, or loot. <br>
<img width="208" alt="Screenshot 2024-11-08 at 11 02 35 AM" src="https://github.com/user-attachments/assets/b4d3c949-0fc6-4ea7-9c98-a0b6426b9ce2">

They will be represented in terms of "?" until clicked on, which by then will reveal a certain **random** loot. <br>
<img src="https://github.com/user-attachments/assets/2d585cca-ed9f-423d-accf-54c8ae5f7a89" width="210" height="140" alt="action"> <br>

Once clicked on an individual action button, it will select a random loot, let's call it button a and item a.
1. Change icon image from "?" to item a image.
2. Execute item a assigned action - often inflicted upon ❤️: #
3. Button a will be rendered redudant - unclickable - until *reroll* is clicked, which then resets. <br>

#### Loot
Each loot has their own value and ability. Which incur different results based on which loot is obtained. 

**Good Loot** <br>
Yarn: gains player 20 ❤️ points. <br>
![yarn](https://github.com/user-attachments/assets/71610c0e-cf52-4758-bad1-c712144594a6)

Food: gains player 8 ❤️ points. <br>
![food](https://github.com/user-attachments/assets/33c13662-d410-4f11-82ec-d016b37dc436)

Catnip: gains player 5 ❤ points + enabled DoubleUp for 5 seconds. <br> 
![catnip](https://github.com/user-attachments/assets/69012f6a-1d6b-44d5-ad0d-6b501b81a21b)

In a scenerio where Catnip is rolled while another DoubleUp is active - Catnip has been rolled previously - the time will be compounded.

This means, that if I roll a Catnip at T = 0, gaining me 5 seconds, and I roll another Catnip at T = 3, I will gain 5 seconds on top of the 5 previous seconds. Even if 3 seconds have been used, the total time that shall elapse if no other Catnip is rolled is 13 seconds. 10 seconds compounded + 3 seconds previously elapsed. 


**Bad Loot** <br> 




## Development 
## System Requirements
## Quick Start





cat clicker thingy

work in progress

note to self, deployment on iOS mutes sound if silent switch is on. turn it off.
