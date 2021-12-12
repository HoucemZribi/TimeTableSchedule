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