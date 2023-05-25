# Information Système Générateur de Rapports

Ces trois script AskSysManV1.sh, AskSysManV2.sh et AskSysManV3.sh Bash génèrent un fichier HTML qui affiche différentes informations système, comme le modèle du processeur, la mémoire et les informations sur le disque.


## Caractéristiques AskSysManV1.sh

- Récupère et affiche le modèle du système.
- Récupère et affiche les informations du CPU, y compris le modèle, le nombre de cœurs et la fréquence.
- Récupère et affiche la température du système.
- Récupère et affiche les informations sur la mémoire.
- Récupère et affiche les informations sur le disque.
- Récupère et affiche l'utilisateur connecté.
- Génère un fichier HTML avec un style par défaut.

## Caractéristiques AskSysManV2.sh

- Utilise les commandes système pour récupérer les informations.
- Génère un rapport HTML avec Bootstrap pour le style.

## Caractéristiques AskSysManV3.sh

- Récupère et affiche le modèle du système.
- Récupère et affiche les informations du CPU.
- Récupère et affiche les informations sur la mémoire.
- Récupère et affiche les informations sur le disque.
- Récupère et affiche l'utilisateur connecté.
- Génère un fichier HTML avec un style CSS personnalisé (fond noir et police verte type console).

## Comment utiliser ces scripts

1. Assurez-vous que le script a des permissions d'exécution. Vous pouvez le faire en utilisant la commande suivante dans votre terminal :
   ```bash
   sudo chmod +x nom_du_script.sh

2. Exécutez le script avec la commande suivante :
    ```bash
    sudo ./nom_du_script.sh

3. Une fois le script exécuté, un nouveau fichier appelé `index.html` sera généré dans le même répertoire que le script.

## Note

Ces scripts ont été conçu pour être utilisés sur des systèmes d'exploitation de type Linux Debian et uniquement testés sur Linux Mint et Linux Raspbian et peuvent ne pas fonctionner correctement sur d'autres systèmes d'exploitation.
