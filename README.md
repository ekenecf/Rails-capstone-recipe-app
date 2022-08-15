![](https://img.shields.io/badge/Microverse-blueviolet)
# Recipe App

### Description
The Recipe app keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe.


## ERD
![image](https://raw.githubusercontent.com/microverseinc/curriculum-rails/main/recipe-app/images/recipe_erd_2_members.png?token=GHSAT0AAAAAABOWCPLA57LZBCWNNJLJ6BIEYXJSSPQ)

### Cloning the project

 git clone https://github.com/sentayhu19/Recipe-app <Your-Build-Directory>
``` 
- cd Recipe-app
- rails s
```


## Built with
- Ruby 3.1.2 on Rails 7.0.3.1
- PostgreSQL

## Prerequisites

vscode or any other

Setup
## Install
    Ruby
    Rails

### Development Database

```sh
# Create user
sudo -u Postgres create user -e ced00 -s
# Load the schema
rails db:schema:load
#----- If you prefer this approach
# Create the database
rake db: create
# Create Database Migration
rails db: migrate
```
### Run

```sh
rails s
```

## Run tests
```sh
bundle install
RSpec
```

## Author

👤 **Nwachukwu Ekene**

- GitHub: [@ekene-Nwachukwu](https://github.com/ekenecf)
- LinkedIn: [Nwachukwu-ekene](https://www.linkedin.com/in/nwachukwuekene/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/sentayhu19/Catalog-of-my-things/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
