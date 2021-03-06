musician(eric_clapton, guitar).
musician(john_mayer, guitar).
musician(john_frusciante, guitar).
musician(john_frusciante, singer).
musician(jimmy_pop, singer).
musician(chad_smith, drums).
musician(anthony_kiedis, singer).
musician(lemmy_kilmister, bass).
musician(ozzy_osbourne, singer).

musician_genre(eric_clapton, rock).
musician_genre(john_mayer, pop).
musician_genre(john_fruciante, alt-rock).
musician_genre(jimmy_pop, punk).
musician_genre(flea, alt-rock).
musician_genre(chad_smith, alt-rock).
musician_genre(anthony_kiedis, alt-rock).
musician_genre(lemmy_kilmister, metal).
musician_genre(ozzy_osbourne, metal).

friends(X, Y) :- \+(X = Y), musician_genre(X, Z), musician_genre(Y, Z).