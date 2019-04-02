Als software-ontwikkelaar loop je soms tegen problemen aan waar je even geen antwoord op weet: *Waarom werken bepaalde operaties niet?*, *Waar gaat de calculatie mis?* kortom; *Waarom krijg ik niet de output die ik verwacht?* De meeste vraagstukken die we dagelijks tegenkomen gaan ervan uit dat je de input en output weet. Je kan met een programeertaal de computer precies vertellen wat hij moet doen om de output te bereiken. Dit soort talen noemen we imperatieve talen. Wat nou als we niet weten wat de output moet zijn, maar wel weten wat de situatie is? Daarvoor hebben we declaratieve (logische) talen.

Na een zondag bezig te zijn geweest met Prolog is het meer duidelijk geworden hoe de taal werkt en wat het van de ontwikkelaar verwacht. Het [boek](https://www.amazon.com/Seven-Languages-Weeks-Programming-Programmers/dp/193435659X) wat ik heb gebruikt voor de kennismaking met Prolog heeft mij geholpen de beginselen door te krijgen. Het mooie aan Prolog is dat je dus geen kennis hoeft de hebben van de oplossing van een probleem. Een goede vergelijking is het repareren van een auto. Je brengt een kapotte auto naar de monteur, geeft aan wat er aan de hand is en hoe je zou willen dat auto werkt. De monteur maakt de auto en jij rijdt later die middag weer vrolijk rond. Prolog is die monteur.


## Feiten & Regels

Prolog werkt met zogenaamde feiten en regels. Met deze feiten en regels dient de ontwikkelaar de situatie te definiëren. Een voorbeeld van feiten en hoe ze werken:

Een lijst met feiten van muzikanten hun *taak* in de band en welk genre ze spelen.
```Prolog
musician(eric_clapton, guitar).
musician(john_mayer, guitar).
musician(john_fruciante, guitar).
musician(jimmy_pop, singer).
musician(lemmy_kilmister, bass).
musician(ozzy_osbourne, singer).

musician_genre(eric_clapton, rock).
musician_genre(john_mayer, pop).
musician_genre(john_fruciante, alt-rock).
musician_genre(jimmy_pop, punk).
musician_genre(lemmy_kilmister, metal).
musician_genre(ozzy_osbourne, metal).
```
