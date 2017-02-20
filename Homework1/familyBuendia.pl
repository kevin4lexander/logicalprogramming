%Programa Familia Buendía
%Hector F. Jimenez, Kevin Moreno H.
%Programacion Logica.2017-2

%Base del conocimiento

hombre('José Arcadio I Buendía').
hombre('Nicanor Ulloa').
hombre('José Arcadio II Buendía').
hombre('Aureliano Buendía').
hombre('Arcadio Buendía').
hombre('Aureliano José Buendía').
hombre('17 Aurelianos Buendía').
hombre('Fernando del Carpio').
hombre('José Arcadio Segundo').
hombre('Aureliano Segundo').
hombre('Gastón').
hombre('José Arcadio Último').
hombre('Mauricio Babilonia').
hombre('Aureliano Babilonia').
hombre('Aureliano II').

mujer('Úrsula Iguarán').
mujer('Rebeca Montiel').
mujer('Amaranta Buendía').
mujer('Rebeca Ulloa').
mujer('Remedios Moscote').
mujer('Pilar Temera').
mujer('Santa Sofia Piedad').
mujer('Renata Argote').
mujer('Remedios Buendía').
mujer('Petra Cotes').
mujer('Fernanda del Carpio').
mujer('Amaranta Úrsula').
mujer('Renata Remedios').

esposos('José Arcadio I Buendía','Úrsula Iguarán').
esposos('Úrsula Iguarán','José Arcadio I Buendía').
esposos('Nicanor Ulloa','Rebeca Montiel').
esposos('Rebeca Montiel','Nicanor Ulloa').
esposos('José Arcadio II Buendía','Rebeca Ulloa').
esposos('Rebeca Ulloa','José Arcadio II Buendía').
esposos('José Arcadio II Buendía','Pilar Temera').
esposos('Pilar Temera','José Arcadio II Buendía').
esposos('Aureliano Buendía','Pilar Temera').
esposos('Pilar Temera','Aureliano Buendía').
esposos('Aureliano Buendía','Remedio Moscote').
esposos('Remedio Moscote','Aureliano Buendía').
esposos('Arcadio Buendía','Santa Sofia Piedad').
esposos('Santa Sofia Piedad','Arcadio Buendía').
esposos('Fernando del Carpio','Renata Argote').
esposos('Renata Argote','Fernando del Carpio').
esposos('Aureliano Segundo','Petra Cotes').
esposos('Petra Cotes','Aureliano Segundo').
esposos('Aureliano Segundo','Fernanda del Carpio').
esposos('Fernanda del Carpio','Aureliano Segundo').
esposos('Gastón','Amaranta Úrsula').
esposos('Amaranta Úrsula','Gastón').
esposos('Mauricio Babilonia','Renata Remedios').
esposos('Renata Remedios','Mauricio Babilonia').
esposos('Aureliano Babilonia','Amaranta Úrsula').
esposos('Amaranta Úrsula','Aureliano Babilonia').

descendiente('José Arcadio II Buendía','José Arcadio I Buendía').
descendiente('José Arcadio II Buendía','Úrsula Iguarán').
descendiente('Aureliano Buendía','José Arcadio I Buendía').
descendiente('Aureliano Buendía','Úrsula Iguarán').
descendiente('Amaranta Buendía','José Arcadio I Buendía').
descendiente('Amaranta Buendía','Úrsula Iguarán').
descendiente('Rebeca Ulloa','Nicanor Ulloa').
descendiente('Rebeca Ulloa','Rebeca Montiel').
descendiente('Arcadio Buendía','José Arcadio II Buendía').
descendiente('Arcadio Buendía','Pilar Temera').
descendiente('Aureliano José Buendía','Aureliano Buendía').
descendiente('Aureliano José Buendía','Pilar Temera').
descendiente('17 Aurelianos Buendía','Aureliano Buendía').
descendiente('Remedios Buendía','Arcadio Buendía').
descendiente('Remedios Buendía','Santa Sofia Piedad').
descendiente('José Arcadio Segundo','Arcadio Buendía').
descendiente('José Arcadio Segundo','Santa Sofia Piedad').
descendiente('Aureliano Segundo','Arcadio Buendía').
descendiente('Aureliano Segundo','Santa Sofia Piedad').
descendiente('Fernanda del Carpio','Fernando del Carpio').
descendiente('Fernanda del Carpio','Renata Argote').
descendiente('Amaranta Úrsula','Aureliano Segundo').
descendiente('Amaranta Úrsula','Fernanda del Carpio').
descendiente('José Arcadio Último','Aureliano Segundo').
descendiente('José Arcadio Último','Fernanda del Carpio').
descendiente('Renata Remedios','Aureliano Segundo').
descendiente('Renata Remedios','Fernanda del Carpio').
descendiente('Aureliano Babilonia','Mauricio Babilonia').
descendiente('Aureliano Babilonia','Renata Remedios').
descendiente('Aureliano II','Aureliano Babilonia').
descendiente('Aureliano II','Amaranta Úrsula').

%Reglas de Inferencia

padre(X,Y):-
    hombre(X), descendiente(Y,X).

madre(X,Y):-
    mujer(X), descendiente(Y,X).

hijo(X,Y):-
    hombre(X), descendiente(X,Y).

hija(X,Y):-
    mujer(X), descendiente(X,Y).

hermano(X,Y):-
    hombre(X), descendiente(X,Z), descendiente(Y,Z), X\==Y.

hermana(X,Y):-
    mujer(X), descendiente(X,Z), descendiente(Y,Z), X\==Y.

hermanos(X,Y):-
    hermano(X,Y); hermana(X,Y).

primo(X,K):-
    hombre(X), descendiente(X,Z), descendiente(K,W), hermanos(Z,W).

prima(X,K):-
    mujer(X), descendiente(X,Z), descendiente(K,W), hermanos(Z,W).

tio(X,N):-
    hombre(X), descendiente(N,Y), hermanos(X,Y).

tia(X,N):-
    mujer(X), descendiente(N,Y), hermanos(X,Y).

abuelo(X,Y):-
    hombre(X), descendiente(Y,Z), descendiente(Z,X).

abuela(X,Y):-
    mujer(X), descendiente(Y,Z),descendiente(Z,X).

nieto(X,Y):-
    hombre(X), (abuelo(Y,X); abuela(Y,X)).

nieta(X,Y):-
    mujer(X), (abuelo(Y,X); abuela(Y,X)).

sobrino(X,Y):-
    hombre(X), (tio(Y,X); tia(Y,X)).

sobrina(X,Y):-
    mujer(X), (tio(Y,X); tia(Y,X)).

suegro(X,Y):-
    padre(X,Z), esposos(Z,Y).

suegra(X,Y):-
    madre(X,Z), esposos(Z,Y).

yerno(X,Y):-
    hombre(X), (suegro(Y,X); suegra(Y,X)).

nuera(X,Y):-
    mujer(X), (suegro(Y,X); suegra(Y,X)).

cunado(X,Y):-
    hombre(X), hermanos(X,Z), esposos(Y,Z).

cunada(X,Y):-
    mujer(X), hermanos(X,Z), esposos(Y,Z).
