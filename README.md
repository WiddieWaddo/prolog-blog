Als software-ontwikkelaar loop je soms tegen problemen aan waar je even geen antwoord op weet: *Waarom werken bepaalde operaties niet?*, *Waar gaat de calculatie mis?* kortom; *Waarom krijg ik niet de output die ik verwacht?* De meeste vraagstukken die we dagelijks tegenkomen gaan ervan uit dat je de input en output weet. Je kan met een programeertaal de computer precies vertellen wat hij moet doen om de output te bereiken. Dit soort talen noemen we imperatieve talen. Wat nou als we niet weten wat de output moet zijn, maar wel weten wat de situatie is? Daarvoor hebben we declaratieve (logische) talen.

Na een zondag bezig te zijn geweest met Prolog is het meer duidelijk geworden hoe de taal werkt en wat het van de ontwikkelaar verwacht. Het [boek](https://www.amazon.com/Seven-Languages-Weeks-Programming-Programmers/dp/193435659X) wat ik heb gebruikt voor de kennismaking met Prolog heeft mij geholpen de beginselen door te krijgen. Het mooie aan Prolog is dat je dus geen kennis hoeft de hebben van de oplossing van een probleem. Een goede vergelijking is het repareren van een auto. Je brengt een kapotte auto naar de monteur, geeft aan wat er aan de hand is en hoe je zou willen dat auto werkt. De monteur maakt de auto en jij rijdt later die middag weer vrolijk rond. Prolog is die monteur.



# Basis Prolog



## Feiten & Regels

Prolog werkt met zogenaamde feiten en regels. Met deze feiten en regels dient de ontwikkelaar de situatie te definiëren. Dit is beter uit te leggen aan de hand van een voorbeeld. Eerst definieeren we de feiten.
```Prolog
musician(john_frusciante, guitar).
musician(john_frusciante, singer).
musician(lemmy_kilmister, bass).
musician(ozzy_osbourne, singer).

musician_genre(john_frusciante, alt-rock).
musician_genre(lemmy_kilmister, metal).
musician_genre(ozzy_osbourne, metal).
```

We geven aan dat John gitaar speelt en zingt, Lemmy speelt Bass en Ozzy zingt. Is dat ook wat Prolog heeft begrepen?
```Prolog
| ?- musician(john_frusciante, guitar).

yes
| ?- musician(john_frusciante, bass).

no
```
Prachtig! Al is dit niet de meest spannende vraag de we aan prolog stellen het geeft wel een beeld van wat je kan verwachten. Eerder hebben we gezegd dat John gitaar speelt. Als we vragen of John gitaar speelt zegt Prolog *yes*. Dat zou het antwoord op vraag twee ook duidelijk moeten maken.

Laten we een regel toevoegen aan het programma.
```Prolog
friends(X, Y) :- 
    \+(X = Y), 
    musician_genre(X, Z), 
    musician_genre(Y, Z).
```
Prolog kan nu antwoord geven op de vraag wie er bevriend zijn.
```Prolog
| ?- friends(lemmy_kilmister, ozzy_osbourne).

yes
```
De regel die we hebben toegevoegd aan het programma maakt gebruik van feiten om te zien of de input tot een *yes* geevalueert kan worden. **friends(X, Y)** is de declaratie van de regel, in Prolog jargon wordt hier ook wel friends/2 gebruikt. De regel wordt afgesloten met :-, dit symbool kun je goed interpreteren als "is yes als:". Hierna volgt een drietal doelen, als deze doelen gezamelijk tot *yes* evalueren dan zal friends/2 dat ook doen. In de eerste aanroep van friends X = lemmy_kilmister & Y = ozzy_osbourne. Dan gaan we kijken naar de implementatie van friends/2. \\+(X = Y) betekend X != Y. In de regels daarna wordt het feit musician_genre/2 aangeroepen. Prolog gaat op zoek naar een situatie waar:
```Prolog
musician_genre(lemmy_kilmister, Z).
musician_genre(ozzy_osbourne, Z).
``` 
Toevallig bevinden beide heren zich in het metal genre en is er dus een situatie waar friends/2 tot *yes* evalueert.

## Wie? Wat?

Nu is het leuk om te weten dat lemmy en ozzy vrienden zijn, maar om die vraag te stellen geven we Prolog eigenlijk als best veel informatie. We kunnen prolog ook zelf een suggestie laten doen. Stel, we willen weten welke instrumenten John in zijn band vervult dan kunnen we dat aan Prolog vragen op deze manier.
```Prolog
| ?- musician(john_frusciante, What).

What = guitar ? ;

What = singer
```
We vragen aan prolog: geef ons alle mogelijke combinaties waar John muziekant is. De tweede parameter *What* is een soort van variabele, alle mogelijke combinaties worden afgegaan en Prolog presenteerd ons de waarde voor *What*.

## Tot zover

We hebben geleerd wat feiten en regels zijn in Prolog. Ook hebben we gekeken naar hoe Prolog met deze feiten omgaat. Misschien is de kracht van Prolog nog niet helemaal duidelijk, maar geloof mij dat komt nog. De enige reden dat we tot dusver niets spannends hebben gezien is, omdat we het antwoord op iedere vraag wisten.



# Syntaxis, Semantiek & Pragmatiek



Normaal gesproken heb ik het in mijn blogs altijd meteen over mijn ervaringen met de Syntaxis, Semantiek & Pragmatiek (SS&P) van een programmeertaal. Voor deze Prolog-blog voelde ik me daar niet toe geroepen. Prolog is dusdanig anders dan waar hedendaags aan wordt gedacht bij programmeertalen. Daarom leek het mij verstandig om eerst de basis van Prolog uit te leggen. Nu je hopelijk doorhebt hoe Prolog werkt kan ik wat vertellen over de SS&P

De syntax van Prolog is niet iets wat ik als lastig heb ervaren. Het zit meer in het moment dat je doorhebt dat je niet bezig bent met de computer vertellen wat hij moet doen, maar een situatie beschrijven. De SS&P wordt hierdoor sterk beïnvloed en is naar mijn mening ook niet te vergelijken met een imperatieve taal. Eigenlijk maak je constant *if else* constructies in Prolog als je de regel uit het eerder voorbeeld vertaald naar pseudocode krijg je dit.
```Prolog
friends(X, Y) :- 
    \+(X = Y), 
    musician_genre(X, Z), 
    musician_genre(Y, Z).

friends(X, Y) is yes als:
    X niet gelijk is aan Y EN
    muziekant X speelt genre Z EN
    muziekant Y speelt genre Z EIND
```
Een punt Betekend niet alleen *EIND* in Prolog, het kan ook staan voor *OF*. friends/2 kan namelijk twee keer gedefinieerd worden. Stel, dat we deze code toevoegen aan het programma.
```Prolog
friends(X, Y) :- 
    \+(X = Y), 
    musician_genre(X, Z), 
    musician_genre(Y, Z).
friends(X, Y) :- 
    \+(X = Y), 
    musician(X, Z), 
    musician(Y, Z).

friends(X, Y) is yes als:
    X niet gelijk is aan Y EN
    muziekant X speelt genre Z EN
    muziekant Y speelt genre Z OF
friends(X, Y) is yes als:
    X niet gelijk is aan Y EN
    muziekant X speelt instrument Z EN
    muziekant Y speelt instrument Z EIND
```
Logisch gezien staan allebei de punten voor *EIND*, maar de functie wordt twee keer gedefinieerd en kan dus goed gelezen worden als *OF*. Ik hoop dat dit een verduidelijking is ten opzichte van eerder getoonde voorbeeld. Tijd voor het echte probleem van vannacht.



# Einstein's Zebra probleem



Prolog excelleert in het oplossen van problemen met harde constraints. Daarom heb ik ervoor gekozen om de Zebra puzzle van Einstein op te lossen. Of de puzzel ook daadwerkelijk door Einstein gemaakt is? wie zal het zeggen. Wikipedia zegt in ieder geval van niet... Dat doet echter niet af aan de mate waarin het een lastig probleem lijkt. De puzzle is vrij simpel in uitleg. Beantwoord de vragen: *Wie drinkt er water?* & *Wie heeft er een Zebra?*. De gegeven data is dit:
1. There are five houses.
1. The Englishman lives in the red house.
1. The Spaniard owns the dog.
1. Coffee is drunk in the green house.
1. The Ukrainian drinks tea.
1. The green house is immediately to the right of the ivory house.
1. The Old Gold smoker owns snails.
1. Kools are smoked in the yellow house.
1. Milk is drunk in the middle house.
1. The Norwegian lives in the first house.
1. The man who smokes Chesterfields lives in the house next to the man with the fox.
1. Kools are smoked in the house next to the house where the horse is kept.
1. The Lucky Strike smoker drinks orange juice.
1. The Japanese smokes Parliaments.
1. The Norwegian lives next to the blue house.

Einstein had ook gewoon een leuke avond kunnen hebben, maar in plaats daarvan heeft hij deze erg vreemde puzzle bedacht... Daar gaan we!


### De feiten
De volledige opdracht bestaat uit feiten en dat is prettig. Nou is het wel zaak om eerst te kijken hoe bepaalde feiten verzekerd kunnen worden. De feiten die we gaan definieeren zijn:
* Een huis moet bestaan.
* Een huis staat links van een ander huis.
* Een huis staat naast een ander huis.
* Een huis staat in het midden.
* Een huis staat vooraan.

**Een huis moet bestaan.**
```Prolog
bestaat(list(Huis, _, _, _, _), Huis).
bestaat(list( _,Huis, _, _, _), Huis).
bestaat(list( _, _,Huis, _, _), Huis).
bestaat(list( _, _, _,Huis, _), Huis).
bestaat(list( _, _, _, _,Huis), Huis).
```
Bestaat/2 heeft dus 5 verschillende situaties waarin het naar *yes* evalueert. Het Huis moet op positie 1, 2, 3, 4 of 5 staan van de meegegeven lijst.

**Een huis staat links van een ander huis**
```Prolog
links_van(list(Huis1,Huis2, _, _, _), Huis1, Huis2).
links_van(list( _,Huis1,Huis2, _, _), Huis1, Huis2).
links_van(list( _, _,Huis1,Huis2, _), Huis1, Huis2).
links_van(list( _, _, _,Huis1,Huis2), Huis1, Huis2).
```
Links_van/3 heeft 4 verschillende implementaties. Er zijn 4 mogelijkheden waarop het meegegeven Huis1 aan de linkerkant staat van Huis2.

**Een huis staat naast een ander huis**
```Prolog
naast(Huizen, Huis1, Huis2):-
    links_van(Huizen, Huis1, Huis2).
naast(Huizen, Huis1, Huis2):-
    links_van(Huizen, Huis2, Huis1).
```
Hier nog een keer goed de Semantiek van Prolog in actie. Naast/3 is *yes* als links_van/3 *yes* is. Enige verschil is natuurlijk de positie van de huizen.

**Een huis staat in het midden**
```Prolog
midden(list( _, _,Huis, _, _), Huis).
```
Vrij simpele implementatie. In de lijst moet Huis op de middelste positie staan.

**Een huis staat vooraan.**
```Prolog
eerste(list(Huis, _, _, _, _), Huis).
```
Werkt hetzelfde als midden, maar op een andere positie.

Nu we alle checks hebben gemaakt hoeven we de feiten van de puzzel alleen maar mee te geven aan het programma.

**Feiten**
```Prolog
wie_heeft_een_zebra(WieWater, WieZebra, Huizen) :-
    % huis(nationaliteit, kleur, dier, drank, sigaret)
    bestaat(Huizen, huis(engelsman,rood, _, _, _)),
    bestaat(Huizen, huis(spanjaard, _, hond, _, _)),
    bestaat(Huizen, huis( _, groen, _, koffie, _)),
    bestaat(Huizen, huis(oekrainer, _, _, thee, _)),
    links_van(Huizen, huis( _,ivoor, _, _, _), huis( _, groen, _, _, _)),
    bestaat(Huizen, huis( _, _, slak, _, oldgold)),
    bestaat(Huizen, huis( _, geel, _, _, kools)),
    midden(Huizen, huis( _, _, _, melk, _)),
    eerste(Huizen, huis(noor, _, _, _, _)),
    naast(Huizen, huis( _, _, _, _,chesterfield), huis( _, _,vos, _, _)),
    naast(Huizen, huis( _, _, _, _,kools), huis( _, _,paard, _, _)),
    bestaat(Huizen, huis( _, _, _,sinasappelsap,luckystrike)),
    bestaat(Huizen, huis(japanner, _, _, _,parliaments)),
    naast(Huizen, huis(noor, _, _, _, _), huis( _,blauw, _, _, _)),

    bestaat(Huizen, huis(WieWater, _, _,water, _)),
    bestaat(Huizen, huis(WieZebra, _,zebra, _, _)).
```
Eigenlijk zijn alleen de laatste twee regels belangrijk voor nu. De variabele WieWater komt terecht in het huis waar degene water drinkt en dat geld ook voor de persoon met de zebra. Laten we kijken wat Prolog ervan maakt.

```Prolog
| ?- wie_heeft_een_zebra(WieWater, WieZebra, Huizen).

Huizen = list(
huis(noor,geel,vos,water,kools),
huis(oekrainer,blauw,paard,thee,chesterfield),
huis(engelsman,rood,slak,melk,oldgold),
huis(spanjaard,ivoor,hond,sinasappelsap,luckystrike),huis(japanner,groen,zebra,koffie,parliaments))

WieWater = noor
WieZebra = japanner ? ;

no
```
Door alleen de feiten mee te geven aan het programma kan Prolog met een oplossing komen voor de puzzel.



# Afsluiting


Ik heb meer plezier gehad met Prolog dan ik na de eerste twintig minuten had gedacht. Het is een taal die erg bruikbaar is voor bepaalde gevallen, waar harde constraints zijn en de feiten bekend. Toch zou je kunnen zeggen dat je de meeste situaties wel kan mappen in Prolog code. Het geeft alternatieven voor lastige problemen en soms ook alternatieven waar je zelf niet aan denkt. Hiervoor kan Prolog erg goed gebruikt worden. Mogelijkheden zijn groot met Prolog, maar omwille van de begrijpbaarheid van de blog heb ik het bondig gehouden. We weten in ieder geval wel wie er water drinkt en wie er een Zebra in huis heeft. Wat hij ermee moet vraag ik mij ook af, maar ik ben bang dat Prolog ons daar niet bij kan helpen.