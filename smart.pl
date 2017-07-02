right_of(X, Y) :- X is Y+1.
left_of(X, Y) :- right_of(Y,X).

next_to(X, Y) :- right_of(X,Y).
next_to(X, Y) :- left_of(X,Y).

solution(Street, FishOwner) :-
     Street = [
         house(1, Nationality1, Color1, Pet1, Drinks1, Smokes1),
         house(2, Nationality2, Color2, Pet2, Drinks2, Smokes2),
         house(3, Nationality3, Color3, Pet3, Drinks3, Smokes3),
         house(4, Nationality4, Color4, Pet4, Drinks4, Smokes4),
         house(5, Nationality5, Color5, Pet5, Drinks5, Smokes5)],
     %/Noruego vive en la primera casa, junto a la azul/
     member(house(1, norweigan, _, _, _, _ ), Street),
     member(house(A, _, blue, _, _, _ ), Street),
     next_to(1, A),

     %/El que vive en la casa del centro, toma leche/
     member(house(3, _, _, _, milk, _ ), Street),

     %/El ingles vive en la casa roja/
     member(house(_, brit, red, _, _, _ ), Street),

     %/La mascota del sueco es un perro/
     member(house(_, swede, _, dog, _, _ ), Street),

     %/El Danes bebe te./
     member(house(_, dane, _, _, tea, _ ), Street),

     %/La casa verde es la inmediata de la lizquierda de la casa blanca/
     member(house(GREEN, _, green, _, _, _ ), Street),
     member(house(WHITE, _, white, _, _, _ ), Street),
     left_of(GREEN, WHITE),

     %/El de la casa verdem toma cafe/
     member(house(_, _, green, _, coffee, _ ), Street),

     %/El que fuma Pall MAll cria pajaros/
     member(house(_, _, _, birds, _, pall_mall ), Street),

     %/El de la casa amarilla fuma Dunhill/
     member(house(_, _, yellow, _, _, dunhill ), Street),

     %/El que fuma blend vive junto al que tiene gatos/
     member(house(BLEND, _, _, _, _, blend ), Street),
     member(house(CATS, _, _, cats, _, _ ), Street),
     next_to(BLEND, CATS),
     %/El que tiene cabalos vive junto al que fuma Dunhill/

     member(house(HORSE, _, _, horse, _, _ ), Street),
     member(house(DUNHILL, _, _, _, _, dunhill ), Street),
     next_to(HORSE, DUNHILL),

     %/El que fuma bluemaster bebe cerveza/
     member(house(_, _, _, _, beer, bluemaster ), Street),

     %/El Aleman fuma Prince/
     member(house(_, german, _, _, _, prince ), Street),

     %/El que fuma Blend tiene un vecino que bebe agua/
     member(house(BLEND, _, _, _, _, blend ), Street),
     member(house(WATER, _, _, _, water, _ ), Street),
     next_to(BLEND, WATER),

     member(house(_, FishOwner, _, fish, _, _ ), Street).
