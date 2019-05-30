[*Back to Index*](index.md.html)


StoryBit Mod Editor
==================
~~~~
"Greetings, Commander.
Welcome to the Story Build-Inspect-Test kit (Story BIT kit): 
the best tool to design a pressure test for your colony 
and challenge other commanders with it!"
~~~~

Overview
----------
The Mod Editor provides instruments for creating custom events (StoryBits) in Surviving Mars which introduce a narrative experience and more gameplay variety to the game.

Periodically, roughly once every 6-10 Sols the system automatically picks one event among all of those that are applicable, and runs it for the player. The event may affect the colony with various one-time or continuous effects activated by the event itself or by a player chosen reply, or both. Events and their replies can enable or directly activate other events (FollowUps), using the same functionalities, potentially building a chain of events. In order to provide a consistent game experience, chained events can track one object associated to them (Associated Object) and all needed timers.

Creating a StoryBit
----------
Right click on empty space in the leftmost column of the editor (Mod Items) and select *New Mod*, name the mod and right click >> **Edit**. 

In the Mod interface, right click on empty space in the leftmost column of and select **New >> StoryBit**.

Each StoryBit has several sections on the rightmost column of the editor (Item Properties): **Mod, General, Activation, Misc, Activation Effects, Notification & Popup, Completion Effects**. Make sure to fill them in order to properly run your event.

Mod & General
----------
The **Group** menu will help you sort your StoryBits.

You should name your StoryBit in the **Id** field. No white spaces and funny symbols. It is not visible by the player (for the visible title see Title in **Notification & Popup** section below).

The **Comment** field and the **Script Done**, **Text ready for validation** and **Texts done** ticks are used to manage the StoryBit development process and they are not visible by the player.

Activation & Misc
----------
Pick a **Category** to determine the event which would trigger your StoryBit. The most used triggering events are **Tick** (i.e. some chance it would start by itself, without any special events), **Tick_FounderStageDone** (the same, but your event won’t start before the Founder Stage is over), and **FollowUp** (this would be a “child” StoryBit enabled or activated by a “parent” StoryBit – see below **FollowUp**). The other triggering events are bound to some specific condition, for example *TechResearched* will (surprisingly!) check when the user researches a Tech. 
Feel free to explore!

The **Enabled** tick shows if your StoryBit is initially enabled – does it try to run when the proper conditions are met, or it waits for another StoryBit to enable it. This should be ticked for your main events and normally it’s unticked for their FollowUps (see Enables in the Completion Effects section).

**Enable Chance** determines the initial chance for this StoryBit to be added to the list of StoryBits which may be triggered in each game, i.e. if you set it to 60, this means there is 60% chance it would appear in a particular game. Use this to make some StoryBits more “exclusive” and let them appear more rarely.

**One Time**, if unchecked, will allow your StoryBit to start again and again when the right conditions are met (but don’t forget it competes with all other StoryBits for the user’s attention, so it may not reappear for quite some time, or ever again). 

**Suppress for (hours)** determines the time after the StoryBit is enabled and before it is actually triggered, in game hours (24 hours = 1 Sol). It is used mainly for a FollowUp – when a main StoryBit enables it, whenever you want the FollowUp to happen a bit later. Suppress is different from Delay (see Activation Effects below) which introduces some waiting time after the StoryBit is triggered. 

**Prerequisites** determine the additional conditions which would stop the StoryBit from running. Use this (see the “+” icon on the right) to ensure your StoryBit would be working as intended and feel believable. For example, if you need to create a StoryBit about a great feast which would make all *Glutton* Colonists very happy, you may want to ensure there are enough of them – pick a prerequisite *CheckColonistCount*, set a suitable amount (say, 20) and pick from the menu a *Trait* Glutton. You may add several prerequisites – the game will check for them all.

If you add a **Pick** prerequisite, you will have sub-menus (see the “+” icon on the right) to specify the conditions needed to narrow the selection of available objects, and let the game pick and “remember” one of them (*Associated Object*). 
!!!
   **Example:** You may select the Prerequisite *Pick from Label* and select any category of things in the game (*Label*) – say, *Colonist*, and add one or more filtering Conditions to narrow it further – for example, *CheckColonistStat* with *Sanity < 10*; then you could click “+” under Conditions to add another filter, for example *HasTrait (colonist)* with Trait *Vegan* and with *Negate Condition* checked.

   In this case, when the event is checked, you will have picked a meat-eating colonist who is just about to snap. Who knows what could go wrong?

Have in mind that the StoryBit system cannot track **more than one object** picked within one StoryBit chain. In a StoryBit and in any subsequent FollowUps connected to it, this object can be referenced to as an **Associated Object** and text-referenced as **<`DisplayName`>** (in Capitals, as shown).

Please note that the Prerequisites you set should **make sense together**, otherwise they may not work and will probably break your StoryBit.

If you leave **Select Object** ticked (see **Misc** section), the picked object will be selected for the player when the StoryBit starts.

Have in mind that if your picked object is **removed** in any way (destroyed, erased, etc.) – for example, the Colonist dies, the StoryBit will **discontinue** when this happens.

In case your StoryBit suggests that the good old **Earth** is there and it’s not unavailable due to a Mystery or another reason (like Third World War started), you may want to pick the prerequisite **SupplyMissionsEnabled** and leave Negate Condition unticked.

Activation Effects
----------
**Disables** allows you to choose which other StoryBit(s) would be disabled when this one kicks. You can use this to create alternative event lines. 
!!!
   **For example**, your StoryBit is about an *Idiot* Colonist who wrote a book so badly, it makes the readers stupid (i.e. he is a *Guru*), and you may want to keep from running another StoryBit which introduces a cure for stupidity which removes the trait Idiot from everyone and replaces it with, say, *Alcoholic*.

**Delay (hours)** makes the StoryBit postpone its activation effects for the indicated time after it has been triggered (24 hours = 1 Sol). Mind that it’s not the same as the **Suppress for** effect (the sequence is *enabled* >> *Suppress for* >> *triggered* >> *Delay*).

**Detach object** would stop the StoryBit from tracking the picked object (see up Prerequisites) whenever there is a Delay. So if you want your StoryBit to persist through the loss of its Associated Object, you should Detach it. Keep in mind, in this case you can no longer use <`DisplayName`> and other *Associated Object* functionalities in this case.

**Activation Effects** determines what happens at the moment when the StoryBit is activated. Select them via the “+” icon on the right.

One of the most useful Activation Effects would be *ForEachExecuteEffects*. 
!!!
   **Example:** You want your StoryBit to create a one-time 10% chance for each of your *Genius* Colonists to discover a new Tech. To do that, you should click the “+” icon and select *ForEachExecuteEffects*; as *Label* pick *Colonist*; choose *Filters >> “+” >> HasTrait (colonist) >> Genius*; leave Random count as 0 and set *Random percent* as 10 (this means 10% of Genius Colonists); choose *Effects >> “+” >> DiscoverTech*, pick a *Field* and leave Tech *-random-*. 

   Alternatively, you could pick botanists, geologists etc., and give the Geniuses of each group a chance to discover a tech in the most appropriate science field for their profession.

The Activation effects will be triggered one by one **in the order** you set them in. You can change this order by using the up and down **arrows** on the right.

Again, make sure the chosen label, filters and effects **make sense together**, otherwise your StoryBit will not work as intended. 

If you have picked an object and it is *removed* in any way (destroyed, killed, erased etc.), the StoryBit will **discontinue**. This means if you want to create a StoryBit in which the protagonist has to die, you should trigger his or her death effect in the Completion Effects section instead (see below) – otherwise the effects will happen, but since the Activation Effects are executed before the Notification & Popup section, the player won’t get to the text notification and the reply choices.

Have in mind that if you use **ActivateStoryBit** as an effect, this means it would be immediately started after the current StoryBit, ignoring suppression time, delay time and prerequisites. In most cases, you may want to use **Enables** instead (see Completion Effects section below).

Notification & Popup
----------
**Title:** This is the actual title of your StoryBit, i.e. the title which the player sees.

**Notification Text** is the subtitle of the notification. Normally, you should leave it as *Your attention is required!*.

There is no substantial difference between **Voiced Text** and **Text**, except that the first is usually being voiced. Both are displayed as different paragraphs. If you want to enter a **new paragraph** within the Text field, make sure to leave an **empty row** between them, as it looks better in-game (hit Enter twice).

If you want to make a **text reference** to the *Associated Object* (last object picked or created), use the string **<`DisplayName`>**. The system will replace it with the name of the picked colonist, dome, rocket etc.

The best practice is to place a short summary of the activation effect, preceded by the string **`<effect>`**. The text after it will be **highlighted** in the text description.
!!! Example:
   `<effect>`Astrologer <`DisplayName`> proclaims the Week of Deadly Calm. All Lazy Colonists gain 20 Morale for 7 Sols.

**Image:** Allows you to pick an image which is shown as an **illustration** of the StoryBit. If left unchanged, the image of any FollowUps is the same as the initial image.

Completion Effects
----------
**Enables:** This effect allows the activation of another StoryBit which was initially *disabled*. You would normally use it to enable a **FollowUp** event which deals with the consequences of the current event, and for this reason is initially disabled. 

**Completion Effects:** The same options as the Activation Effects, but triggered after them and after showing the title, text and replies of the StoryBit (see Activation Effects).

Parameters
----------
The best practice is to **pre-set all parameters** you would use in the StoryBit, so you would be able to easily **track and change them later**, or use them as **variable text strings**.
You can do that by picking **New Attribute** from the main menu and choosing a parameter type (*Number, Funding, Percent, Research Points, Resource, Sols*). 
!!!
   **For example**, your StoryBit needs a chance to decrease the *Health* of a number of colonists. You can create two *Number* parameters for that and name them, say, *Health_Loss* and *Health_Loss_Chance*, and set some values for them – the first may be -50 and the latter 25. Now you can set up the *Activation Effects* you need by clicking the **Param** button and picking the parameter that suits your purpose, instead of entering a raw value. 

   In the given example, it would be *ForEachExecuteEffects* >> Label *Colonist* >> *Random percent* >> click *Param* >> pick *Health_Loss_Chance* >> Effects *ModifyColonistStat* >> Stat *Health* >> *Amount* >> click *Param* >> pick *Health_Loss*.

   At a later point you may need to *change the parameter*. Once you have it set up, you can simply enter another value without the need of going through all the menus. In our example, if you consider that the loss of 50 Health looks like a bit too much, you may later decide to find the parameter Health_Loss and set it to -25 instead.

Another use of the parameters is that you can put them in **text** by copying their **Tag attribute** (i.e. the name of the parameter closed in < and > angle brackets). In the above example, you can compose the following text:
!!!
   `<effect><Health_Loss_Chance>`% of your colonists lost `<Health_Loss>` Health.

For your convenience, there are other **Parameter types** besides the common Number type: *Funding, Percent, Research Points, Resource, Sols*. They work in the same way, they just provide the correct symbols and text in a **consistent way** as everywhere else in the game. 
!!!
   In the above example, if you enter *Health_Loss_Chance* as a *Percent* type parameter, its tag will automatically acquire the correct symbol: `<health_loss_chance>`%.

Parameters can also be used in **Replies** and **Outcomes** within the same StoryBit (see below).

Replies
----------
The Replies provide **options** for the player to react, choose the consequences or make a statement according the situation you put them in.

You can add a new Reply by choosing from the main menu **New Attribute >> New Reply**. 

It is recommended to provide **no more than 4 Replies**, if you want them to look good in the game interface.

In the rightmost column (*Item Properties*) you can set up all the necessary **elements** of the Reply option.


	* **Text:** This is the “flavor” text explaining the choice of the player. Keep it short: app. 10–12 words is okay.

	* **Outcome Text:** This is a hint about the gameplay effect of the chosen Reply. Again, keep it short.

	* **Cost:** The price in *Funding* for choosing this Reply. If the player has this amount, picking this Reply will automatically deduct it from his or her available *Funding*. If the player doesn’t have this amount, the respective Reply option will be unavailable.

	* **Prerequisite:** Here you may add some conditions which have to be met, so this Reply would be available for the player. 

   You cannot choose **more than one Prerequisite** per Reply.

   When the prerequisite is a **Commander Profile**, you can choose between the options *IsCommander* (the player has or doesn’t have a specific Commander Profile, for example Rocket Scientist) and *IsCommander2* (the player has one or doesn’t have any of two listed Commander Profiles, for example Rocket Scientist or Astrogeologist).
!!!
   **Attention!** Care to not put the player in a situation where he or she has no choice, or only one choice. Make sure there are at least two Replies which don’t need any Funding, nor special prerequisites. Another way to avoid this situation is to put such requirements in the StoryBit Activation Prerequisites, i.e. it wouldn’t start at all if the player doesn’t have the needed amount of Funding, or that number of Research Labs, or whatever you intend to put at risk with some Reply.

	* **Hide if disabled:** When checked, this option won’t show this particular Reply to the player when the prerequisites for it have not been met (hidden reply). You can use this option to provide more than 4 Replies, if some of them will be mutually exclusive. For example, one of the Replies suggests having the Sponsor Japan, and the other – Brazil. 

	* **Comment:** Not visible by the player. Used for noteworthy remarks like “this reply will make them SUFFER, muahahaha”.

You can **copy** and **paste** Replies with all of their properties.

Outcomes
----------
The Outcomes contain the **effects** of each Reply (unless you want the Reply to have no effect).

You can add a new Outcome by choosing from the menu **New Attribute >> New Outcome**. 

An outcome may contain **multiple effects**.

Adding **more than one Outcome** to a single Reply means that only **one of them will happen**, with chance according to the *Weight* you have set for each one of them (see *Weight* below).

In the rightmost column (*Item Properties*) you can set up all the necessary **elements** of the Outcome.

	* **Prerequisites:** What conditions must be met for an Outcome to activate its effects – aside from the Prerequisite of the Reply. 

	* **Weight:** This determines the chance for one Outcome to happen as related to other possible Outcomes of the same Reply. Consider as “possible” only those Outcomes which have their conditions met. 
!!!
   **Example:**
   So if you have set an Outcome with *Weight* 30 and another one with 70, the first has 30% chance to happen; however, if the latter has an unmet requirement (for example, *Colonists number > 50* and the player has 40 Colonists), the first Outcome will have 100% chance to happen.

	* **Enables:** StoryBits (normally FollowUps) enabled by this Outcome.

	* **Disables:** StoryBits disabled by this Outcome.

	* **Title**, **Voiced Text**, **Text**: You may leave these empty; when the player chooses the respective Reply, the Outcome does what it does and the situation is over. However, you can fill these to provide some more explanation to what happened. Note that it is more fair if you hint about the possible consequences before they happen – in the Reply Text or Outcome Text (see Replies section). Only if the consequences are quite random or more complicated, or you need to provide some more flavor, it may be reasonable to fill these text fields.

	* **Image:** Change this if you want the Image set in the StoryBit to be replaced with another image. 

	* **Effects:** This is all the Outcome is about. The possible effects are the same as above (see Activation Effects section and Completion Effects section).

You can **copy** and **paste** Outcomes with all of their properties.

FollowUp
----------
A FollowUp event is created as a normal StoryBit which has the **Category** *FollowUp*. By default it is **not Enabled** and depends on another StoryBit (or one of its Outcomes) to **enable** it.

Setting a StoryBit as a FollowUp adds two more available *Properties*:

	* **Trigger:** This is the activation condition needed for the FollowUp to run. Normally, it should be left as *Tick*. But you may need another trigger.
!!!
   **For example**, if your StoryBit enables a new **Expedition** as one of its effects (*CreatePlanetaryAnomaly*), the FollowUp trigger may be *Rocket Landed* and it would need as a Prerequisite *IsCustomAnomaly* in order to recognize the associated anomaly.

	* **Inherits Object:** This option should stay ticked if the FollowUp makes use of an object created or picked in the main StoryBit (as it is in the above example).

A FollowUp can have its own Replies, Outcomes and all other properties of a StoryBit. You can **chain** FollowUps in such way that they build a whole story. However, it can become a bit messy and get out of hand. It is recommended that your first StoryBits are **simple** and not dependent on too complex conditions.

Testing a StoryBit
----------
Whenever you like, you can (and you should) test your StoryBit. You can do that by **loading a game save** of *Surviving Mars*, alt-tabbing to the Mod Editor, selecting a StoryBit and clicking the **Test** button in the menu above. When you alt-tab back to your loaded game, you will see your StoryBit *activated*. It is recommended that you test out **all possible Replies and Outcomes**, in order to avoid silly mistakes (we people tend to make mistakes, even when we’re super careful).

**Common mistakes:**

	* The *Text* or *Custom Text* of a StoryBit or a Reply is **too long**, or there are **too many Replies** (the interface has some limitations for aesthetical reasons – normally, you shouldn't add more than four Replies).

	* You want to make a Colonist lose some *Stat*, but you forgot to give a **negative value** (-) to the *Parameter* used.

	* Setting different effects in *different Outcomes* under **the same Reply** (if you want all of them to happen, they should be set in the same Outcome). 

	* Neglecting a **Property** in some complex effect.
!!!
   **For example**, you want to give 20 *Morale* to all *Geologists* for 10 *Sols*. To do that, you pick *ForEachExecuteEffects* and select *Colonist*; then you add the effect with *ModifyObject* and select *base_morale*, add the parameters for *Amount* 20 and *Sols* 10... But you forgot to set a filter under Colonist and limit them only to *HasTrait >> Geologist*. As a result, all Colonists will gain *Morale* instead of *Geologists* only.

A word to the wise
----------
Keep it short. Keep it simple. 

Provide a few meaningful choices and make them appeal to different people or situations. 

Provide consequences for the choices. Make sure these consequences are believable and not out of the blue.

Give each choice some gameplay effect. If possible, give it some moral weight. 

Ultimately, make the player feel responsible for his or her actions.

Sample StoryBit
----------
Look at the sample StoryBit provided with your Mod Editor: **ForeignerInAForeignLand**.
It demonstrates some of the most used triggers, prerequisites and effects, with various Replies, Outcomes and Parameters in use.



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>