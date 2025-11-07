# UNLOCK-Time-Paradox-Chronicles-of-the-Terminal
L’histoire se déroule dans un futur proche.
Tu es Alex Turner, un technicien du Centre de Stabilisation Temporelle.
Une faille s’est ouverte dans la ligne du temps : les événements du passé 🕰️ , du présent ⚙️ et du futur 🚀 sont en train de se mélanger.
Ta mission : voyager à travers trois époques pour rétablir l’ordre temporel avant que la réalité ne s’effondre.

Chaque époque contient une anomalie temporelle que tu dois résoudre.
Quand tu résous les trois, le temps se remet en place et tu gagnes.

Mais attention : tu n’as que 30 minutes virtuelles (un timer) avant la “boucle paradoxale” — si tu échoues, tout recommence.



# 🧭 MANUEL DES COMMANDES — Chronicles of the Terminal
« Le Terminal est ton seul outil.
 Chaque commande est un pas vers la maîtrise du temps. »

⚙️ Lancer un module
./01_start_passe.sh
./01_start_present.sh
./01_start_futur.sh

👉 La commande ./ (point-slash) signifie exécuter un script dans le répertoire actuel.
 Tu dois être dans le dossier du module pour le lancer.
 Chaque module démarre un scénario unique avec son ambiance et ses indices.

🧾 Lire et explorer des fichiers
1️⃣ Lister les fichiers
         ls
Affiche tous les fichiers présents dans le dossier.
 Les fichiers commençant par un point . 
Astuce :
 Pour voir aussi les fichiers cachés :
         ls -a


2️⃣ Afficher le contenu d’un fichier
cat <nom_du_fichier>

Montre le contenu du fichier dans le terminal.
C’est utile pour lire les indices cachés, comme les journaux ou les codes.

3️⃣ Chercher un mot dans un fichier
grep <mot> <fichier>

Recherche toutes les lignes contenant le mot .
 Très utile pour repérer des indices ou des codes dissimulés dans le texte.

🧩 Manipuler les processus
1️⃣ Afficher les processus actifs
   ps aux

Montre tous les processus en cours sur ton système.
 Chaque ligne contient :
Le nom du programme


Le PID (Process IDentifier) → un numéro unique


2️⃣ Rechercher un processus spécifique
ps aux | grep processus

La barre verticale | (pipe) envoie la sortie d’une commande dans une autre.
 Ici, elle filtre le résultat pour ne montrer que le processus contenant le nom.

3️⃣ Terminer un processus
kill <PID>

Exemple :
kill 12345

Arrête un processus grâce à son numéro PID.
 C’est essentiel dans le module Présent et Futur pour neutraliser les noyaux parasites.

🧑‍🔧 Gérer les utilisateurs
Ajouter un utilisateur 
sudo adduser < nom d’utilisateur >

Cette commande crée un nouvel utilisateur système.
⚙️ Étapes :
Tape un mot de passe aléatoire (n’importe lequel).


Confirme le mot de passe.


Appuie sur Entrée plusieurs fois pour passer les questions.


Termine avec yes pour confirmer la création.


Si tu oublies le sudo, la commande échouera.

🌐 Communication et fichiers réseau
Tester la connexion temporelle
ping @IP

Envoie des signaux à un serveur pour tester la connexion réseau.
 Dans le Futur, cette commande permet de “réveiller” le flux temporel.
💡 Astuce : tu peux enregistrer le résultat dans un fichier avec le chevron > :
ping @IP > FICHIER.txt

Le chevron > signifie rediriger la sortie vers un fichier.
 Si le fichier existe déjà, il sera remplacé.

🗃️ Archives et sauvegardes
Créer une archive
tar -czf <nom_archive.tar.gz> <fichiers...>

c → crée une archive


z → compresse avec gzip


f → spécifie le nom du fichier

Extraire une archive
tar -xvzf <archive.tar.gz> -C <dossier>

x → extrait les fichiers


v → affiche les fichiers extraits (verbose)


z → indique que c’est une archive gzip


f → précise le nom de l’archive


-C → spécifie le dossier de destination
💡 Indice dans le jeu :
“Le futur se décompresse sous la pression du temps.”

🔧 Modifier et comparer
Modifier un fichier avec vi
vi <fichier>

Le mode vi est un éditeur intégré dans le terminal.
Pour entrer du texte → appuie sur i (insertion mode)
Pour supprimer une ligne → appuie sur dd
Pour supprimer un caractère → appuie sur x 
Pour sauvegarder et quitter → appuie sur Échap, puis tape :wq et Entrée


Pour quitter sans sauvegarder → Échap, puis :q!



Comparer deux fichiers
diff <fichier1> <fichier2>

Affiche les différences entre deux fichiers.
 Très utile dans le Futur.


📁 Manipuler les dossiers et fichiers
Créer un dossier
mkdir <nom_du_dossier>
Déplacer ou renommer un fichier
mv <source> <destination>


💬 Entrées et redirections
Écrire du texte dans un fichier
echo "<texte>" > <fichier>

 Essentiel dans le module Passé pour remettre l’horloge en marche.

🧩 Vérification et réinitialisation
Vérifier ton avancement
./verification_<module>.sh < code >

Vérifie si toutes les actions nécessaires ont été effectuées.


Réinitialiser un module
./remise_zero.sh

Remet tous les fichiers et processus à leur état d’origine.
 Idéal pour recommencer à zéro après une erreur.

“Chaque commande laisse une trace.
 Chaque action modifie le temps.
 Et toi, voyageur… sauras-tu exécuter le bon ordre ?”

# 🎮 Ce que j’ai retenu de ce projet ( Petit retour )

J’ai vraiment aimé coder ce jeu. C’était un projet à la fois technique et créatif, et j’y ai mis beaucoup d’énergie. J’ai utilisé ChatGPT pour m’aider à avancer : parfois, il m’a fait gagner beaucoup de temps, mais d’autres fois, il m’a un peu fait reculer, car certaines réponses n’étaient pas tout à fait justes. J’ai donc appris à ne pas juste copier, mais à comprendre le code par moi-même.
J’ai compris pas mal de choses, j’ai modifié des parties, mais il reste encore des zones floues — par exemple, la boucle du processus parasite et la création du fichier PID. Il y a aussi eu quelques bugs, surtout avec les fichiers ChronoCore et QuantumCore dans les modules du Présent et du Futur. Le code n’est pas toujours parfaitement optimisé, mais il fonctionne et raconte une histoire.
Ce que je pourrais améliorer, c’est surtout la gestion du temps et l’organisation de mon travail. Malgré tout, j’ai adoré développer Chronicles of the Terminal, et j’ai fait de mon mieux à chaque étape.



