Minute taken live in Matthieu's Raspberry
=========================================

Braimstorming
------------
### Goals
- Idée de base: faire la promotion publique des user groups et partager les dates de réunion.
- Un outil pour les user groups de Sophia.
- Montrer la dynamique des user groups
- Donner l'envie aux gens de participer aux user groups

### Propositions initiales
- gestion des membres/groupes: membres basiques s'enregistrent, les admins acceptent les membres dans les groupes
- aggrégation de différents blogs des membres
- aggrégation de sources externes (type RSS)
- évènements avec inscriptions
- collaboration entre les user groups / croisement de resources
- discussions avec fédération des différents user groups
- communautés qui lancent des évènements
- autres cadres que le développement (ex: robotique) mais qui reste local
- hiérarchie? site unique + communautés? => site communautaire
- cloud de communautés avec un système de tags des topics
- moyens de partager ou de demander des resources (relations, speakers, argent, salles, outils) => lister les resources
- outil pour les réunions: est ce vraiment nécessaire car d'autres outils existent déja (meetup, G+, lanyard)
- historique des évènements
- montrer l'activité des membres en plus des réunions
- ajouter une valeur locale
- aggrégateur de plusieurs medias sociaux
- informations locales plus que techniques?
- trouver les entreprises dans certains domaines
- recherche de travail
- sponsoring
- networking professionnel
- recensement des compétences
- users recoivent les notifications par le canal qu'ils choisissent
- ne pas créer un paradis doré supplémentaire
- trouver des gens passionés
- les items (events, posts, users, groups) sont taggués, les tags sont enregistrés sous la forme d'une hiérarchie et les users ont un ranking sur les tags en fonction des évènements auxquels ils ont participés
- Groupes et membres avec sa description, ses sponsors, ses activités, son blog, avec tous les items taggés

### User stories

    créer un membre
    créer un groupe
    associer un membre à un groupe
    créer un admin
    créer un évènement
    associer un groupe à un évènement
    créer un tag
    associer un tag à un groupe
    associer un tag à un évènement
    hiérarchie de tags
    recherche d'évènement par tag
    associer un membre à un tag
    créer un blog pour un group
    ajouter un post à un blog de groupe

### Technologie
- Backend grails avec un service "withFormat" qui peut servir des pages html basique (Twitter Bootstrap) ou fournir des données json/xml
- Base de données MongoDB
- Names
-- hugme
-- geekhub
-- groupfront
-- FreeUGs
-- MeetUG

Fil de l'eau
------------
Welcome to the Riviera GUG Coding Week End!
Useful links: 
   
    Grails Doc: http://grails.org/doc/latest/
    Twitter Bootstrap doc: http://twitter.github.com/bootstrap/index.html
    MongoDB quick start: http://www.mongodb.org/display/DOCS/Quickstart

***
importing Twitter bootstrap... OK (grails-plugin finalement)
***
added MongoDB Grails plugin in the project , please pull changes 
***
added Member and Group Domain objects, please pull and scaffold 
***
Clean Sebastien target directories... 
***
I'm waiting for the scaffolding !!!! <- easiest when you can run the app... ;)
***
creating default layout + (empty) home page (  can't test (ToT)  )
***
Seb doit tester avant de faire un push +1+1+1
***
Fabrice a pusher des logs.Pfffffffffffffffffffffffffff
***
4:13am still alive
***
Find a way to avoid the grails command Integrate with --eclipse
***
UG-hub has a new home ==> http://localhost:8080/ughub/home/index  !!!! (git poule)
***
We have something http://ughub.cloudfoundry.com/home/index  4h35
***
Ca y est on a un mort SEb est couche
***
ughub Boostrap des données à bloc !!!
***
CI is working and push automatically
***
Pushed Event domain class
***
Pushed Blog... not sure this one is usefull for now
***
Added many_to_many relationship
***
Filipo is the only one still alive... everyone else is sleeping or living... see you tomorow!
***
Scaffolding is now dynamic and Bootstrap compliant.
***
17h00 : Pascal Revient
***
Reinforcements arrived !!!
***
Dimanche matin: 06:52 | il reste que Fred et moi, j'ai une page de profil la classe qui save. Je commit, je push, et j'me couche!!
***
Ouep, Homepage des groupes mise à jour, je pars pour un "git couche" :D
***
Oauth cliemnt secret 
***
c koi le nom de la properiete????
***
Filippo?
***
in ~/.grails/
***
add ughub-config.properties or ughub-config.groovy
***
add this content to the file
***
http://groovy.codehaus.org/groovy-jdk/ pour une doc des methodes ajoutees sur les classes du jdk
***
From Filippo, continuous delivery is continious outage


