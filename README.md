# TransformerGame
Build ​an ​iOS ​application ​for ​the ​following:
The ​Transformers ​are ​at ​war ​and you ​are ​in ​charge ​of ​settling ​the ​score! ​You’re ​to ​evaluate ​who ​wins ​a
fight ​between ​the ​Autobots ​and ​the ​Decepticons. ​Here ​are ​the ​rules.
Each ​Transformer ​has ​the ​following ​criteria ​on ​their ​tech ​spec ​(see
http://www.ntfa.net/ntfa/techspecs/index.php?cat=Gen1&group=DeceptPZ&char=Predaking ​for ​an
example):
● Strength
● Intelligence
● Speed

● Endurance
● Rank
● Courage
● Firepower
● Skill
All ​of ​these ​criteria ​are ​ranked ​from ​1 ​to ​10.
The ​“overall ​rating” ​of ​a ​Transformer ​is ​the ​following ​formula:
(Strength ​+ ​Intelligence ​+ ​Speed ​+ ​Endurance ​+ ​Firepower)
Each ​Transformer ​must ​either ​be ​an ​Autobot ​or ​a ​Deception.
Your ​program ​should ​take ​input ​that ​describes ​a ​group ​of ​Transformers ​and ​based ​on ​that ​group
displays:
a. The ​number ​of ​battles
b. The ​winning ​team
c. The ​surviving ​members ​of ​the ​losing ​team
The​ ​basic​ ​rules​ ​of​ ​the​ ​battle​ ​are:
● The ​teams ​should ​be ​sorted ​by ​rank ​and ​faced ​off ​one ​on ​one ​against ​each ​other ​in ​order ​to
determine ​a ​victor, ​the ​loser ​is ​eliminated
● A ​battle ​between ​opponents ​uses ​the ​following ​rules:
○ If ​any ​fighter ​is ​down ​4 ​or ​more ​points ​of ​courage ​and ​3 ​or ​more ​points ​of ​strength
compared ​to ​their ​opponent, ​the ​opponent ​automatically ​wins ​the ​face-off ​regardless ​of
overall ​rating ​(opponent ​has ​ran ​away)
○ Otherwise, ​if ​one ​of ​the ​fighters ​is ​3 ​or ​more ​points ​of ​skill ​above ​their ​opponent, ​they ​win
the ​fight ​regardless ​of ​overall ​rating
○ The ​winner ​is ​the ​Transformer ​with ​the ​highest ​overall ​rating
● In ​the ​event ​of ​a ​tie, ​both ​Transformers ​are ​considered ​destroyed
● Any ​Transformers ​who ​don’t ​have ​a ​fight ​are ​skipped ​(i.e. ​if ​it’s ​a ​team ​of ​2 ​vs. ​a ​team ​of ​1, ​there’s
only ​going ​to ​be ​one ​battle)
● The ​team ​who ​eliminated ​the ​largest ​number ​of ​the ​opposing ​team ​is ​the ​winner
Special​ ​rules:
● Any ​Transformer ​named ​Optimus ​Prime ​or ​Predaking ​wins ​his ​fight ​automatically ​regardless ​of
any ​other ​criteria
● In ​the ​event ​either ​of ​the ​above ​face ​each ​other ​(or ​a ​duplicate ​of ​each ​other), ​the ​game
immediately ​ends ​with ​all ​competitors ​destroyed
For​ ​example,​ ​given​ ​the​ ​following​ ​input:
Soundwave, ​D, ​8,9,2,6,7,5,6,10
Bluestreak, ​A, ​6,6,7,9,5,2,9,7
