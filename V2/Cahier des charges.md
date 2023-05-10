# Cahier des charges

## Projet initial

Créer dans le cadre du projet d'apothéose de l'école O'clock, le projet initial O'L'asso est une application de gestion de l'association Batala. N'ayant pu réaliser que le MVP, j'ai décidé de reprendre ce projet, de le modifier et de dévelloper un ceratin nombre de feature manquantes. 

Aisni, j'ai ajouté la gestiuon de la trésorerie, des évènments, de la messagerie et d'un systeme de tickets .

De plus, ce travail sera pour moi l'occasion de m'approprier les techniques que nous avions explorés, et de les approfondir .

### MVP

*Front :*

- Une page de connections, qui vérifire la couple email/login, décrypté.
- Un lien de reset password, avec une génération en interne d'un mdp
- Une page d'acceuil qui permet de la navigation : infos perso, instruments, costumes, évenements et une board de contact simple
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
- réfléchir à la gestion des membres mineurs
- intégration d'une gestion des évenèments
  
#### Features dev

si en cours de routes j'ajoute des fonctionnalités qui ne seront pas lié à la v3, c'est ici qu'elles seront notés.

### MCD

|*Asso*|
|--------|
Pole
Responsable
Mail
Mot_de_passe

|*Adhérents*|
|----------|
Code_Adhérent
Url_photo
Nom
Prénom
Surnom
Email
Mot_de_passe
Date de naissance
Téléphone
Adresse
Code postale
Genre_costumes
Taille_haut
Taille_bas
Status
Instruments


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

|*Pret_Instruments*|
|-----------------|
Code_location
Code_utilisateur
Code_instrument
Date_pret

|*Costumes*|
Code_costume
Groupe
Genre
Observations
Taille

|*Pret_Costumes*|
|-------------|
Code_pret
Code_costume
Code_utilisateur
Date_pret

|*Trésorerie*|
|------------|
Code_Facture
Date_d’émission
Date_de_paiements
Sujet
Pole

|*Trésorerie_adhérent*|
|----------------------|
Code_trésorerie
Code_adhérent
Status_caution
Statuts_cotisation

|*Tickets*|
|---------|
Code_ticket
Code_pole
Code_adhérent
Status
Contenu

|*Messagerie*|
|-------------|
Code_message
Code_adhérent
Code_Pole
Date_envoi
Sujet
Contenu
Status

**Event on progress**

|*Event*|
|-------|
Code_Event
Type
Date
Status
Content

|*Event_participants*|
|--------------------|
Code_EventParticipants
Code_Event

#### Mocodo tentaculaire

:
Tickets : Code_tickets, Code_pole, Code_adhérent, Status, Contenu
:
Asso : Pole, Responsable (adhérent_id), Mail, Mot_de_passe
:

Pret_Costumes: Code_pret, Code_costume, Code_utilisateur, Date_pret
est échangé , 01 Adhérents, 01 Asso , 11 Tickets : Code_adhérent, Code_Pole, Code_Tickets
est membre, 01 Adhérents, 11 Asso : Responsable, Code_Adhérent
Communique, 01 Adhérents, 01 Asso, 11 Messagerie : Code_Adhérent, Code_Pole, Code_message
:

Costumes: Code_costume, Groupe, Genre, Observations, Taille
porte , 01 Adhérents, 01 Costumes, 11 Pret_Costumes : Code_Adhérent, Code_Costumes, Code_pret
Adhérents: Code_Adhérent, Url_photo, Nom, Prénom, Surnom, Email, Mot_de_passe, Date_de_naissance, Téléphone, Adresse, Code postale, Genre_costumes, Taille_haut, Taille_bas, Status
Messagerie: Code_message, Code_adhérent, Code_Pole, Date_envoi, Sujet, Contenu
régie,  01 Asso, 11 Trésorerie : Pole, Pole

joue de, 0N Adhérents, 01 Instruments, 11 Pret_Instruments : Code_Instrument, Code_Adhérent
Pret_Instruments: Code_location, Code_utilisateur, Code_instrument, Date_pret
scrute, 01 Adhérents, 01 Pret_Instruments, 11 Trésorerie, 11 Trésorerie_adhérent : Code_Adhérent, Code_pret, Code_trésorerie, Code_Facture
Trésorerie : Code_Facture, Date_d’émission, Date_de_paiements, Sujet, Pole
:

Instruments: Code_Instrument, Nom, Pupitre, Type, Observations, Profondeur, Tirants, Poids, Sticker,
:
Trésorerie_adhérent : Code_trésorerie, Code_Adhérent, Status_caution, Statuts_cotisation
:
:

## Technologies utilisés

SQL
postgresql
ApolloServer
pgAdmin
B-crypt
