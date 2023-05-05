# Cahier des charges

## Projet initial

Créer dans le cadre du projet d'apothéose de l'école O'clock, ce projet de groupe est trés vite apparu bancal pour moi, dans sa forme. j'ai donc décider de le reprendre et d'y apporter les modifications nécessaire, étapes par étapes. De plus, ce travail me permettra aussi de m'approprier les echniques qui ont été accaparés par mon binome. je reproduirais une méthodo similaire afin de produire un résultat qui me satisfera.

### MVP

*Front :*

- Une page de connections, qui vérifire la couple email/login, décrypté.
- Un lien de reset password, avec ne génération en interne d'un mdp
- Une page d'acceuil qui permet de selcla navigation : infos perso, instruments, costumes, évenements et une board de contact simple
- Des vues déaillées en listes pour les instruments et les costumes
- Une vue en formulaire pour les infos perso
- Tickets depuis instruments evenements et costumes pour contacter rapidement le pole
- Page pole pour des messages spécifiques

- Pour les profiles asso : des options pour rajouter les instruments costumes adhérents et les supprimer, gestion des mails
- Tickets secrets
- Pour l'admin : création de role asso supplémentaire, de tables supplémentaires via un formulaire tout remplis

*Back :*

- gestion automatiser des tables de prets
- vérification des email, téléphone, sanitizer à insulte
- génération mot de passe
- quantité instrument et costumes

#### Features dev

si en cours de routes j'ajoute des fonctionnalités qui ne seront pas lié à la v3, c'est ici qu'elles seront notés.

### MCD

|*Asso*|
|--------|
Pole
Responsable( adhérent_id)
Mail
Password

|*Adhérent*|
|----------|
Code_Adhérent
Url_photo
Nom
Prénom
Surnom
Email
Mot de passe
Date de naissance
Téléphone
Adresse
Code postale
Genre_costumes
Taille_haut
Taille_bas
Status
Cotisations

|*Instruments*|
|--------------|
Code_Instrument
Nom
Pupitre
Type
Observations
Profondeur
Tirants
Poids
Sticker

|*PretInstruments*|
|-----------------|
Code_utilisateur
Code_instrument
Date_pret

|*Costume*|
Code_costume
Groupe
Genre
Observations
Taille

|*PretCostume*|
|-------------|
Code_costume
Code_utilisateur
Date_pret

|*Trésorerie*|
|------------|
Date d’émission
Date de paiements
Sujet de la facture
Commission responsable

|*Trésorerie_adhérent*|
|----------------------|
Code_adhérent
Status_caution
Statuts_cotisation

|*Tickets*|
|---------|
Code_pole
Code_adhérent
Status

#### Mocodo tentaculaire
