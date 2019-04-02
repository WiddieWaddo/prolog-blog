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


midden(list( _, _,Huis, _, _), Huis).
eerste(list(Huis, _, _, _, _), Huis).

bestaat(list(Huis, _, _, _, _), Huis).
bestaat(list( _,Huis, _, _, _), Huis).
bestaat(list( _, _,Huis, _, _), Huis).
bestaat(list( _, _, _,Huis, _), Huis).
bestaat(list( _, _, _, _,Huis), Huis).

links_van(list(Huislinks,Huisrechts, _, _, _), Huislinks, Huisrechts).
links_van(list( _,Huislinks,Huisrechts, _, _), Huislinks, Huisrechts).
links_van(list( _, _,Huislinks,Huisrechts, _), Huislinks, Huisrechts).
links_van(list( _, _, _,Huislinks,Huisrechts), Huislinks, Huisrechts).

naast(Huizen, Huis1, Huis2):-
    links_van(Huizen, Huis1, Huis2).
naast(Huizen, Huis1, Huis2):-
    links_van(Huizen, Huis2, Huis1).