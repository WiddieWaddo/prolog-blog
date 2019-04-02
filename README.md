Als software-ontwikkelaar loop je soms tegen problemen aan waar je even geen antwoord op weet: *Waarom werken bepaalde operaties niet?*, *Waar gaat de calculatie mis?* kortom; *Waarom krijg ik niet de output die ik verwacht?* De meeste vraagstukken die we dagelijks tegenkomen gaan ervan uit dat je de input en output weet. Je kan met een programeertaal de computer precies vertellen wat hij moet doen om de output te bereiken. Dit soort talen noemen we imperatieve talen. Wat nou als we niet weten wat de output moet zijn, maar wel weten wat de situatie is? Daarvoor hebben we declaratieve (logische) talen.

Na een zondag bezig te zijn geweest met Prolog is het meer duidelijk geworden hoe de taal werkt en wat het van de ontwikkelaar verwacht. Het [boek](https://www.amazon.com/Seven-Languages-Weeks-Programming-Programmers/dp/193435659X) wat ik heb gebruikt voor de kennismaking met Prolog heeft mij geholpen de beginselen door te krijgen. Het mooie aan Prolog is dat je dus geen kennis hoeft de hebben van de oplossing van een probleem. Een goede vergelijking is het repareren van een auto. Je brengt een kapotte auto naar de monteur, geeft aan wat er aan de hand is en hoe je zou willen dat auto werkt. De monteur maakt de auto en jij rijdt later die middag weer vrolijk rond. Prolog is die monteur.


## Feiten & Regels

Prolog werkt met zogenaamde feiten en regels. Met deze feiten en regels dient de ontwikkelaar de situatie te definiëren. Dit is beter uit te leggen aan de hand van een voorbeeld. Eerst definieeren we de feiten.
```Prolog
musician(john_fruciante, guitar).
musician(lemmy_kilmister, bass).
musician(ozzy_osbourne, singer).

musician_genre(john_fruciante, alt-rock).
musician_genre(lemmy_kilmister, metal).
musician_genre(ozzy_osbourne, metal).
```

Wat is nu de situatie die we hebben gedefinieerd? In de feiten geven we aan de John gitaar speelt. Lemmy speelt Bass en Ozzy is zanger. Is dat ook wat Prolog heeft begrepen?
```Prolog
| ?- musician(john_fruciante, guitar).

yes
| ?- musician(john_fruciante, bass).

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
| ?- friends(lemmy_kilmister, john_fruciante).

no
```
De regel die we hebben toegevoegd aan het programma maakt gebruik van feiten om te zien of de input tot een *yes* geevalueert kan worden. **friends(X, Y)** is de declaratie van de regel, in Prolog jargon wordt hier ook wel friends/2 gebruikt. De regel wordt afgesloten met :-, dit symbool kun je goed interpreteren als "is yes als:". Hierna volgt een drietal doelen, als deze doelen gezamelijk tot *yes* evalueren dan zal friends/2 dat ook doen. In de eerste aanroep van friends X = lemmy_kilmister & Y = ozzy_osbourne. Dan gaan we kijken naar de implementatie van friends/2. \+(X = Y) betekend X != Y. In de regels daarna wordt de feit musician_genre/2 aangeroepen. Prolog gaat op zoek naar een situatie waar:
```
musician_genre(lemmy_kilmister, Z).
musician_genre(ozzy_osbourne, Z).
``` 
Toevallig bevinden beide heren zich in het metal genre en is er dus een situatie waar friends/2 tot *yes* evalueert.

