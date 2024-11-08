# CatClicker
**CatClicker** is a simple game where you -the player- gain love points for your cat through either random loot, or by manually clicking on the cat. Not unlike [Cookie Clicker ](https://en.wikipedia.org/wiki/Cookie_Clicker) in certain aspects. 

**Table of Contents**
* [App Concept](https://github.com/s028214/CatClicker/blob/main/README.md#app-concept) - Concept, explanation and gameplay
* [Developement](https://github.com/s028214/CatClicker/edit/main/README.md#development) - Code documentation
* [System Requirement](https://github.com/s028214/CatClicker/edit/main/README.md#system-requirements) - Needed hardware/software
* [Quick Start](https://github.com/s028214/CatClicker/edit/main/README.md#quick-start) - xCode and iOS deployment 

**App Icon <br>**
<img src="https://github.com/user-attachments/assets/fde41669-1df2-48c2-aff2-987b40c4349f" width="70" height="70" alt="Icon">

# App Concept
Gain as many points as possible for Filipe (or whatever you call the lil car), the Cat! 
Run down of frontend UI + game explanation. For clarity, "love" points can also be described as ❤️ points. <br>

*Note: The following visual demonstration are recordings of a Xcode Simulation (iPhone 15 Pro) instead of an actual iPhone deployment*

## Points counter
Similarly to cookie clicker, you are able to gain or lose ❤️: # <br>
In the app, it'll be displayed in terms of a percentage on the top of your device. <br>
<img width="176" alt="Screenshot 2024-11-08 at 9 32 24 AM" src="https://github.com/user-attachments/assets/93dcc814-8f8c-4ec2-a5be-af92579e6910"> <br>
Each 10 "love" points is calcualted as 1%. 


## Clicky cat 
By default, you can click on the cat to gain 1 ❤️ point. Background white. <br> 
<img width="208" alt="Screenshot 2024-11-08 at 9 44 08 AM" src="https://github.com/user-attachments/assets/9b47c0a4-190c-4cc0-9c03-ddfba1ae6a73"> <br> 

During doubleUp, you'll gain 2 ❤️ points per click until it disables - will set back to default. Background yellow. <br> 
<img src="https://github.com/user-attachments/assets/137c56cc-4ade-4e45-b0c8-7b646380707d" width="210" height="210" alt="clicky"> <br>

## Action
An array of a 3x2 (across and down) with hidden values, or loot. <br>
<img width="208" alt="Screenshot 2024-11-08 at 11 02 35 AM" src="https://github.com/user-attachments/assets/b4d3c949-0fc6-4ea7-9c98-a0b6426b9ce2">

They will be represented in terms of "?" until clicked on, which by then will reveal a certain **random** loot. <br>
<img src="https://github.com/user-attachments/assets/2d585cca-ed9f-423d-accf-54c8ae5f7a89" width="210" height="140" alt="action"> <br>

Once clicked on an individual action button, it will select a random loot, let's call it button a and item a.
1. Change icon image from "?" to item a image.
2. Execute item a assigned action - often inflicted upon ❤️: #
3. Button a will be rendered redudant - unclickable - until *reroll* is clicked, which then resets. <br>

### Loot
Each loot has their own value and ability. Which incur different results based on which loot is obtained. 

**Good Loot** <br>
Yarn: gains player 20 ❤️ points. <br>
![yarn](https://github.com/user-attachments/assets/71610c0e-cf52-4758-bad1-c712144594a6)

Food: gains player 8 ❤️ points. <br>
![food](https://github.com/user-attachments/assets/33c13662-d410-4f11-82ec-d016b37dc436)

Catnip: gains player 5 ❤ points + enabled DoubleUp for 5 seconds. <br> 
![catnip](https://github.com/user-attachments/assets/69012f6a-1d6b-44d5-ad0d-6b501b81a21b)

In a scenerio where Catnip is rolled while another DoubleUp is active - Catnip has been rolled previously - the time will be compounded.

This can be represented in an example:

<h4 align="left">
<pre>
T = Time
S = Seconds
<br>

T = 0s - Roll a Catnip (a)  
DoubleUp Enabled for 5s

-Assume 3 seconds pass- 

T = 3s - Roll another Catnip (b) 
DoubleUp will see that Catnip (a) is still in effect, add Catnip (b) 5 seconds to Catnip (a) 5 seconds for another 10s.
TLDR; DoubleUp enabled for another 10s. Regardless of Catnip (a)'s being used by 3 seconds already - Compounds. 

-Assume no more catnip is rolled + 10 more seconds elapse- 

T = 13s - DoubleUp expires, disables.  
</h4>
</pre>


**Bad Loot** <br>
Wet Cat: Loses player 20 ❤ points <br>
![wetCat](https://github.com/user-attachments/assets/9358c5e7-4c6b-49c6-9f21-ae3d4a0f127f)

Expired Food: Loses player 12 ❤ points <br>
![expired](https://github.com/user-attachments/assets/922edeba-9f02-4d0a-9a18-4425b0703cd4)

Dirty Litterbox: Loses player 5 ❤ points <br>
![litterBox](https://github.com/user-attachments/assets/0154468a-eeaa-4330-b407-2742f8f158c0)


### Reroll
When clicked, it will reroll - or set action back to "?" - all [action](https://github.com/s028214/CatClicker/edit/main/README.md#action) buttons <br>
Unlimited uses. Bottom - Right underneath Action. 
<br>![reroll](https://github.com/user-attachments/assets/354aa5e6-e579-4d58-987f-fd3c518cc942)<br>

### Mute/Unmute Button & Background Music
Music will play _on loop_ when app is launched. Pauses when app is unfocused - in the background. <br>

[original music](https://www.youtube.com/watch?v=65nj2f7723A) <br>
is it good enough to be called "elevator music"? <br>
by @shyllis 

Mute button is next to [reroll](https://github.com/s028214/CatClicker/edit/main/README.md#reroll) with reactive icon <br>
When clicked, mutes or unmutes audio. 

![mute unmute](https://github.com/user-attachments/assets/f4ca1114-e1e1-4203-bb55-289e9193552b)

*note to potential users, if the music doesn't seem to work in an actual iPhone deployment (not counting Xcode iPhone simulators) <br>*
*Check to make sure the silent switch isn't on. If it is, turn it off. That will fix the audio - silent switch seemingly mutes audio*

# Development 
// TODO - FOR DEVELOPERS, EXPLAINS PROJ CODE (mainly for myself as the developer to understand/record how more complex Xcode code functions works)

# System Requirements
* An Apple Computer with MacOS - *Reference: Macbook Air 2020 M1*
* Must have Xcode 15.4+ installed

# Quick Start
There are two parts to the quick start. [A](https://github.com/s028214/CatClicker/edit/main/README.md#a---xcode-easy-option) and [B](https://github.com/s028214/CatClicker/edit/main/README.md#b---iphone-deployment). A is getting it into Xcode, B is getting it into your iPhone (optional). 
Exercise caution. It may not work for you like it did for me. Always double check with other references before proceeding.

## A - Xcode (EASY OPTION)
1. Download Xcode. Instructions @ [Apple](https://developer.apple.com/documentation/safari-developer-tools/installing-xcode-and-simulators)
2. Head over to [CatClicker](https://github.com/s028214/CatClicker) Main Repository - Make sure it is the "Main" branch.
3. On the top right, click the drop down green button called "<> Code"
4. Click "open with Xcode", a popup might appear, click "open" or similar icon. 
*Visual Instructions for steps #2 #3 #4* <br>
![Screen Recording 2024-11-08 at 2 48 56 PM](https://github.com/user-attachments/assets/79436cf4-ef4f-4ab1-8f02-5633b8a332c0)
5. It should automatically open Xcode. Follow the steps on screen. It will then launch the project.

## B - iPhone Deployment
Make sure you have a capable iPhone with iOS 17.5+. For reference, iPhone deployment was tested on iPhone 15 with iOS 18.0.1.

I used this [tutorial](https://www.youtube.com/watch?v=blnXWaOK7i0) on Youtube. Follow the instructions. <br>
You can also use this [tutorial](https://www.youtube.com/watch?v=TlgumE2xe_E) as helping reference for the prior mentioned one. <br>
As previously mentioned, do your research as well just to be **safe!** <br>




*cat clicker thingy · 2024*
