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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  Séances                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
 * seances(?Nom, ?Mat, ?Prof, ?Type, ?Groupe, ?Ids).
 *
 * Définition de plusieurs séances à la volée
 *
 * @arg Nom     Nom des séances
 * @arg Mat     Id Matière
 * @arg Prof    Id Prof
 * @arg Type    Type de cours
 * @arg Groupe  Id Groupe
 * @arg Ids     Liste d'atomes servant d'ids pour ces séances
 */


% mrsim1 %
% AI %


seances('CM AI', ai, salwa_said, cm, mrsim1, [
    cm_ai1_1, cm_ai1_2, cm_ai1_3, cm_ai1_4, cm_ai1_5
]).

seances('CM AI', ai, salwa_said, cm, mrsim1, [
    cm_ai1_1, cm_ai1_2, cm_ai1_3, cm_ai1_4, cm_ai1_5
]).

seances('TD AI Groupe 1', ai, salwa_said, td, mrsim1_1, [
    td_ai1_1_1, td_ai1_1_2, td_ai1_1_3, td_ai1_1_4, td_ai1_1_5
]).

seances('TD AI Groupe 2', ai, salwa_said, td, mrsim1_2, [
    td_ai1_2_1, td_ai1_2_2, td_ai1_2_3, td_ai1_2_4, td_ai1_2_5
]).

seances('DS AI', ai, salwa_said, ds, mrsim1, [
    ds_ai1
]).


% Proba %

seances('CM Proba', proba, mariem_farhat, cm, mrsim1, [
    cm_proba_1, cm_proba_2, cm_proba_3, cm_proba_4, cm_proba_5
]).

seances('TD Proba Groupe 1', proba, mariem_farhat, td, mrsim1_1, [
    td_proba_1_1, td_proba_1_2, td_proba_1_3, td_proba_1_4, td_proba_1_5
]).

seances('TD Proba Groupe 2', proba, mariem_farhat, td, mrsim1_2, [
    td_proba_2_1, td_proba_2_2, td_proba_2_3, td_proba_2_4, td_proba_2_5
]).

seances('DS Proba', proba, mariem_farhat, ds, mrsim1, [
    ds_proba
]).


% ri %

seances('CM ri', ri, rafik_abbes, cm, mrsim1, [
    cm_ri_1, cm_ri_2, cm_ri_3, cm_ri_4, cm_ri_5
]).

seances('TD ri Groupe 1', ri, rafik_abbes, td, mrsim1_1, [
    td_ri_1_1, td_ri_1_2, td_ri_1_3, td_ri_1_4, td_ri_1_5
]).

seances('TD ri Groupe 2',ri, rafik_abbes, td, mrsim1_2, [
    td_ri_2_1, td_ri_2_2, td_ri_2_3, td_ri_2_4, td_ri_2_5
]).

seances('DS ri', ri, rafik_abbes, ds, mrsim1, [
    ds_ri
]).


% Graphes %

seances('CM Graphes', graphes, imen_matoui, cm, mrsim1, [
    cm_graphe_1, cm_graphe_2, cm_graphe_3, cm_graphe_4, cm_graphe_5
]).

seances('TD Graphes Groupe 1', graphes, imen_matoui, td, mrsim1_1, [
    td_graphe_1_1, td_graphe_1_2, td_graphe_1_3, td_graphe_1_4, td_graphe_1_5
]).

seances('TD Graphes Groupe 2', graphes, imen_matoui, td, mrsim1_2, [
    td_graphe_2_1, td_graphe_2_2, td_graphe_2_3, td_graphe_2_4, td_graphe_2_5
]).

seances('DS Graphes', graphes, imen_matoui, ds, mrsim1, [
    ds_graphe
]).



% Architecture %

seances('CM Architecture', architecture, amira_zrelli, cm, mrsim1, [
    cm_arch_1, cm_arch_2, cm_arch_3, cm_arch_4, cm_arch_5
]).

seances('TD Architecture Groupe 1', architecture, amira_zrelli, td, mrsim1_1, [
    td_arch_1_1, td_arch_1_2, td_arch_1_3, td_arch_1_4, td_arch_1_5
]).

seances('TD Architecture Groupe 2', architecture, amira_zrelli, td, mrsim1_2, [
    td_arch_2_1, td_arch_2_2, td_arch_2_3, td_arch_2_4, td_arch_2_5
]).

seances('DS Architecture', architecture, amira_zrelli, ds, mrsim1, [
    ds_arch
]).



% Logic Floue %

seances('CM Logic Floue', logic, lotfi_tlig, cm, mrsim1, [
    cm_flou1_1, cm_flou1_2, cm_flou1_3, cm_flou1_4, cm_flou1_5
]).

seances('TD Logic Floue Groupe 1', logic, lotfi_tlig, td, mrsim1_1, [
    td_flou1_1_1, td_flou1_1_2, td_flou1_1_3, td_flou1_1_4, td_flou1_1_5
]).

seances('TD Logic Floue Groupe 2', logic, lotfi_tlig, td, mrsim1_2, [
    td_flou1_2_1, td_flou1_2_2, td_flou1_2_3, td_flou1_2_4, td_flou1_2_5
]).



seances('DS Logic Floue', logic, lotfi_tlig, ds, mrsim1, [
    ds_flou1
]).


% Francais %

seances('CM fr', c, fawzi_harrathi, cm, mrsim1, [
    cm_fr_1, cm_fr_2, cm_fr_3, cm_fr_4, cm_fr_5
]).



seances('DS fr', c, fawzi_harrathi, ds, mrsim1, [
    ds_fr
]).


% Algo %

seances('CM Algo', algo, jassem_mtimet, cm, mrsim1, [
    cm_algo_1, cm_algo_2, cm_algo_3, cm_algo_4, cm_algo_5
]).

seances('TD Algo Groupe 1', algo, jassem_mtimet, td, mrsim1_1, [
    td_algo_1_1, td_algo_1_2, td_algo_1_3, td_algo_1_4, td_algo_1_5
]).

seances('TD Algo Groupe 2', algo, jassem_mtimet, td, mrsim1_2, [
    td_algo_2_1, td_algo_2_2, td_algo_2_3, td_algo_2_4, td_algo_2_5
]).

seances('DS Algo', algo, jassem_mtimet, ds, mrsim1, [
    ds_algo
]).


% ang%

seances('CM ang', ang, mohamed_nouasria, cm, mrsim1, [
    cm_ang_1, cm_ang_2, cm_ang_3, cm_ang_4, cm_ang_5
]).


seances('DS ang', ang, mohamed_nouasria, ds, mrsim1, [
    ds_ang
]).