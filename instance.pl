%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Groupes                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
/**
 * groupe(?Groupe, ?Effectif)
 *
 * @arg Groupe      Nom du groupe
 * @arg Effectif    Nombre d'étudiants dans le groupe
 **/

groupe(mrsim1, 65).
groupe(mrsim1_1, 32).
groupe(mrsim1_2, 33).



/**
 * incomp(-G1, -G2)
 *
 * @arg G1     Nom du groupe 1
 * @arg G2     Nom du groupe 2
 */

incomp(mrsim1, mrsim1_1).
incomp(mrsim1, mrsim1_2).




/**
 * incompatibles(-Groupe1, -Groupe2)
 *
 * Définit l'incompatibilité entre 2 groupes (si il y a des étudiants en commun)
 *
 * @arg Groupe1     Nom du groupe 1
 * @arg Groupe2     Nom du groupe 2
 */
% reflexive
incompatibles(X, X) :- !.

% symétrique
incompatibles(X, Y) :- incomp(X, Y), !.
incompatibles(X, Y) :- incomp(Y, X), !.

/**
 * matiere(?Matiere)
 *
 * @arg Matiere     Nom de la matière
 **/


%matiere mrsim1%

matiere(ai).
matiere(ri).
matiere(proba).
matiere(graphes).
matiere(logic).
matiere(architecture).
matiere(algo).
matiere(fr).
matiere(ang).
matiere(reseau).

/**
 * prof(?Prof)
 *
 * @arg Prof     Nom de l'enseignant
 **/

prof(salwa_said).
prof(amira_zrelli).
prof(fawzi_harrathi).
prof(mariem_farhat).
prof(rafik_abbes).
prof(jassem_mtimet).
prof(imen_matoui).
prof(mohamed_nouasria).
prof(lotfi_tlig).
prof(nedra_benltaief).
/**
 * plage(?Id, -Start, -End)
 *
 * @arg Id      Id de la plage horaire
 * @arg Start   Heure de début de la plage
 * @arg End     Heure de fin de la plage
 */
plage(1, '08h15', '09h45').
plage(2, '09h55', '11h25').
plage(3, '11h30', '13h00').
plage(4, '14h00', '15h30').
plage(5, '15h45', '17h15').

/**
 * mois(?IdMois).
 *
 * @arg IdMois  Id du mois
 */
mois(1).
mois(2).
mois(3).
mois(4).
mois(5).

/**
* joursParMois(-Nb).
*
* @arg Nb  Nombre de jours par mois
*/
joursParMois(20).

/**
* date(?IdJour, ?IdMois)
*
* @arg IdJour  Id du jour
* @arg IdMois  Id du mois
*/
date(J, M) :-
    mois(M),
    joursParMois(Max),
    between(1, Max, J).

/**
 * dateBefore(+J1, +M1, +J2, +M2)
 *
 * Test si date 1 < date 2
 * @arg J1  Jour date 1
 *
 * @arg M1  Mois date 1
 * @arg J2  Jour date 2
 * @arg M2  Mois date 2
 */
dateBefore( _, M1,  _, M2) :- M1 < M2, !.
dateBefore(J1, M1, J2, M2) :- M1 = M2, J1 < J2, !.


/**
 * typeCours(?Type)
 *
 * @arg Type  Un type de cours
 */
typeCours(cm).
typeCours(td).
typeCours(ds).

/**
 * salle(?Nom, ?Effectif, ?Types)
 *
 * @arg Nom         Nom de la salle
 * @arg Effectif    Nombre de place disponibles
 * @arg Types       Listes de types de cours
 **/

salle(01, 60, [cm, ds]).
salle(03, 60, [cm, ds]).
salle(05, 60, [cm, ds]).
salle(07, 60, [cm, ds]).
salle(17, 50, [td, cm]).
salle(01, 50, [td, cm]).
salle(03, 150, [cm, ds]).
salle(06, 35, [td]).
salle(03, 35, [td]).
salle(08, 35, [td]).
salle(06, 60, [td, cm]).
salle(01, 60, [td, cm]).
salle(06, 35, [td]).
salle(03, 35, [td]).
salle(08, 35, [td]).
salle(05, 30, [td]).
salle(07, 30, [td]).
salle(01, 65, [cm, ds]).

salle(01, 40, [td]).
salle(03, 40, [td]).
salle(05, 40, [td]).
salle(07, 40, [td]).
salle(09, 40, [td]).
salle(11, 40, [td]).
salle(13, 40, [td]).
salle(15, 40, [td]).
salle(02, 100, [cm]).
salle(06, 100, [cm]).
salle(12, 100, [cm]).


/**
 * salle(?Nom, ?Effectif)
 *
 * @arg Nom         Nom de la salle
 * @arg Effectif    Nombre de place disponibles
 **/
salle(S, N) :- salle(S, N, _). % TODO add tests

/**
 * accueille(+Salle, ?TypeCours)
 *
 * @arg Salle       Nom d'une salle
 * @arg TypeCours   Type de cours que la salle accueille
 */
accueille(S, T) :-
    salle(S, _, L),
    member(T, L).