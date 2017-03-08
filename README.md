# moddota modders overthrow (working title)
Meme overthrow custom game by dota 2 modders

Heroes can be based on any silly idea, this is a meme mod afterall, anything goes. Heros can be based on anything, it can be a joke within dota 2 community (like a hero with pocket riki ability), it can be a parochial joke that only Russians will get (petri reborn), it can be based upon a joke in the modding community (A hero that has an ultimate that is always in development and never gets released or a hero that doesnt have any skills himself and has to steal or pay for skills), they can have basic abilities with just different names or it can be a super complicated hero with all original abilities, anything, the main thing is to have fun and not be too serious. 

# Winners: 
Everbody who submitted a hero gets a vote on their favourite for a few different categories.<br>
**Most Memey:** The hero that is best representative of meme overthrows custom games.<br>
**Most Original:** The hero which is most unique in its origanality.<br>
**Most Simple yet Effective:** The hero which is most very simple yet ingenious. <br>
**Most Technically Challenging:** The hero which is most technically proficient.<br><br>

This is all for fun, but just as a sweetener, any winner of a cateogry will also recieve 25 USD. 

# How To Add a Hero:
I'm assuming most modders know this part, but if it helps anyone, than it will be worth writing it up.<br>
**1.** Create a new branch on this github, no need to fork, if you do not have contributor status just request it and it will be given.<br>
![Alt Text](https://i.gyazo.com/5ca48db8fdfdbc17758cecfc9037927c.gif)<br>
**2.** Its best to use sourcetree to clone this repistory to your local system, to clone, copy the url of this github and in sourcetree click FILE > CLONE. Choose a folder and it will start downloading, this will take a while.<br> 
![Alt Text](https://i.gyazo.com/30b513c8946711ef8a97e93ac408838d.gif)<br>
**3.** "Fetch" from origin to download the list of branches, and then checkout your branch, this makes it your working copy.<br>
![Alt Text](https://i.gyazo.com/fabfd9620a11dd6f2adf17a46b2392b3.png)<br>
**4.** Change the necessary files, these are the minimum files you will need to change, for a more complicated hero, you may need to add LUA scripts, custom particles, icons, etc, ask for help if you need it, however, in this mod its not necessary to have a complicated hero.<br><br>
**herolist.txt:**<br> Enable the hero, this makes it appear in pick screen.<br>
![Alt Text](https://i.gyazo.com/33d44bf0be81269f52666ea2cb62d755.png)<br><br>
**npc_abilities_custom.txt or npc_abilities_override.txt:**<br> If you are adding new abilities, use custom file, if you are changing the values of existing dota 2 abilities, use abilities_override.<br>
![Alt Text](https://i.gyazo.com/83feb0481b302da9919ae34579c90e1a.png)<br><br>
**npc_heroes_custom.txt:**<br> Here you pick a hero to override, and give it a new model if you want and change its base arrtibutes, also here is where you change their default abilities.<br> 
![Alt Text](https://i.gyazo.com/25b1720e55669aebef622c09194f919f.png)<br><br>
**addon_english.txt:**<br> Here you add text to your new abilities, or if you are overriding, use the text strings of existing abilities and it will override their default texts.<br>
![Alt Text](https://i.gyazo.com/164f61892a51cf455d09aa7847628e70.png)<br><br>

**5.** Create a dota 2 mod in the tools dlc, and copy the game and contents into their equivalents folder in steam, if you don't know how to do this, ask for help or check one of the tutorials on moddota. After copying, launch the mod and make sure everything works. Sourcetree should detect all the changes you have made, commit the changes and then push the changes to your new branch<br><br>
**6.**  . And then from this github you can click pull requests, new pull request and make one from your branch to master. 
![Alt Text](https://i.gyazo.com/e700667d9888658bc86cc46e7bc303e5.gif)<br><br>

**For more examples, check the pull requests that have already been merged, they will show exactly what files need to be modified https://github.com/darklordabc/overmemed/pulls?q=is%3Apr+is%3Aclosed**

## Done Heros
5 out of 112 <br>
**Lich King** - Cookies <br>
![alt tag](https://i.gyazo.com/c8e6ba9ecdd0d48596f110bb66647b4b.png)<br>
**Radiant Jungle** - Chen - Idea by Baumi, Implmentation by Yahnich<br>
![alt tag](https://i.gyazo.com/81bea5f34049e0312dcdac2a3b7d2cc4.png)<br>
**Literally Dota IMBA** - Mirana - by Firetoad<br>
![alt tag](https://i.gyazo.com/8449555d7de4f1a59dab27504a504474.png)<br>
**Its a Tree** - Wisp<br>
![alt tag](https://i.gyazo.com/c25e0ec2cd3d22d6385964a8d053e0e4.png)<br>
**Roshan** - Beast Master<br>
![alt tag](https://cloud.githubusercontent.com/assets/16277198/23677824/d20f1326-03d5-11e7-8201-caf0a503e967.png)<br>


