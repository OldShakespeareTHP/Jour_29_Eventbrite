# **The Gossip Project, Facebook Style**

Genere un site affichant une liste de potins. Possible d'editer ou d'ajouter des potins, ainsi que de les commenter. Possible d'afficher l'ensemble des potins, les potins par ville, les commentaires des potins. Possible de liker les potins de differents endroits.
Fait avec rails.

## :black_square_button: **Installation**

1. ```git clone https://github.com/ForejyTHP/Jour_29_Eventbrite.git```
2. ```cd Jour_29_Eventbrite```
3. ```bundle install```
4. (```rails db:drop```, si besoin pour supprimer les tables déjà existantes)
4. ```rails db:create```
5. ```rails db:migrate```
6. ```rails db:seed```
7. ```rails db:s```, pour lancer le server
8. ```rails db:c```, si besoin pour lancer la console

## :black_square_button: Ouvrir la page suivante :
[http://localhost:4567/](http://localhost:3000/)

## :black_square_button: Acces au site sur Heroku :
https://forejyeventbrite.herokuapp.com/

Et si necessaire pour Heroku :
1. ```heroku restart```
2. ```heroku pg:reset DATABASE (no need to change the DATABASE)```
3. ```heroku run rails db:migrate```
4. ```heroku run rake db:seed (if you have seed)```
 
<details> <summary> A venir</summary>
 
* ``` Rien pour le moment ```

</details>

## 👤Auteur
Joffrey Marques : [ForejyTHP](https://github.com/ForejyTHP)
