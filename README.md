The Gossip Project Sinatra

Bienvenue de ce projet. Pour le tester lancer la commande :
shotgun -p 4567
(faites un bundle install avant)

L'arborescence du projet est la suivante

the_gossip_project_sinatra
├── app.rb
├── README.md
├── Gemfile
├── Gemfile.lock
├── config.ru
├── db
│   └── gossip.csv
└── lib
    ├── controller.rb
    ├── gossip.rb
    └── views
        ├── index.erb
        ├── edit.erb
        ├── show.erb
        └── new_gossip.erb

Cette application permet de créer une liste de potins, pour chacun d'entre eux, on a un auteur, un contenu, et des commentaires. depuis le menu principal, on peut créer un nouveau gossip via le lien "Créer un nouveau potin". On peut aussi acceder à la page de détail d'un potin en cliquant sur le potin en question. Sur la page de détail, on peut également voir tous les commentaires de potins et en ajouter d'autres. On peut aussi modifier le potin avec le lien "Editer le potin".

Tous les potins sont stockés dans le fichier db/gossip.csv