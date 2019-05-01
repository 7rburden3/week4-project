# Week 4 Solo Project - Record Store

Create an app to demonstrate OOP using Ruby, Test Driven Development, Web Programming (REST, MVC) and interaction with a PostgreSQL database.
The app is to be created using only:
- HTML/CSS
- Ruby
- Sinatra
- PostgreSQL

## Brief - Record Store

The owner of a Record Store wants an app which will help to keep on top of the store inventory. This is not an app that customers will see, but will be used to check stock levels and see what needs to be ordered soon.

You should be able to add stock, which would have an Artist and Album as well as the quantity available.

You could also twist this brief for another kind of store if you wish.

MVP:
- Create albums with the quantity that are in stock
- Create artists
- Show an inventory page listing albums and artists
- Show a stock level for the inventory items e.g. High/Medium/Low
Possible Extensions:
- Add a buy and sell price to each stock item
- Calculate the possible markup on items and show on inventory page
- Add a genre to an Album
- Any other ideas you might come up with

## App Overview

The app is run from the app.rb file. This contains all the connections to the other files contained within the project folder structure. The start point is
>localhost:4567/index

To populate the database with test data, run the **seeds.rb** file contained within the db folder.

The folder structure contains:
- *controllers folder* for the files that dictate how the app operates dependant on which function of the app is being completed.
- *db folder* contains the information required to create, populate with test data and run any query sent to the database.
- *models folder* contains the files containing the methods required for the CRUD operation of the database, based on the instructions received from the files contained within the *views* folder
- *public folder* contains folders for the CSS and images used to display the app.
- *specs folder* contains TDD methods.
- *views folder* contains the folders and files containing the logic to run the app.
