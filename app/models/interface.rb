class Interface

    attr_reader :prompt, :protein, :recipe, :recipe_ingredient
    attr_accessor :user, :recipe_ingredient_arr


    def initialize
        @prompt = TTY::Prompt.new
    end 

    def welcome
        system 'rake db:seed'
        system 'clear'
        Logo.start
        puts "Hello, and welcome to Crockpot Recipe Finder!"
        puts " "
        sleep(2)
        login_page
    end 

    def login_page
        prompt.select("Login or Sign up") do |menu|
            menu.choice "Login", -> {login_helper}
            menu.choice "Sign up", -> {sign_up_helper}
            menu.choice "Exit", -> {exit_helper}
        end
    end

    def login_helper
        username = prompt.ask("Enter Username")
        password = prompt.ask("Enter Password")
        if User.find_by(name: username, password: password)
            self.user = User.find_by(name: username, password: password)
            # no music yet
            puts "Let's Get Cookin, #{self.user.name.upcase}!!!"
            sleep(1.5)
            main_menu
        else
            puts "Incorrect Username or Password"
            sleep(1.5)
            login_page
        end
    end

    def sign_up_helper
        username = prompt.ask("Enter Username")
        while User.find_by(name: username.downcase)
            puts "This username is already taken, please create a different username"
            username = prompt.ask("Enter Username")
        end
        password = prompt.ask("Enter Password")
        self.user = User.create(name: username, password: password)
        puts "Sign up complete."
        sleep(0.8)
        puts "Let's Get Cookin #{self.user.name.upcase}!!!"
        sleep(1.5)
        main_menu
    end

    def main_menu
        prompt.select("What would you like to do today #{user.name}?") do |menu|
            menu.choice "Choose Protein", -> {choose_protein}
            menu.choice "Exit!", -> {exit_helper}
            menu.choice "Delete Account!?!?", -> {delete_account_helper}
        end
    end

    def exit_helper
        puts "Goodbye 👋"
        sleep(2)
        system 'clear'
    end

    def delete_account_helper
        current_user = User.find(self.user.id)
        current_user.delete
        puts "Your account has successfully been deleted."
        sleep(2)
        welcome
    end

    def choose_protein
        system 'clear'
        prompt.select("Which protein would you like to see recipes for?") do |menu|
            Protein.all.each do |protein|
                menu.choice protein.name.capitalize, -> {main_menu_protein(protein.id)}
            end
        end
    end

    def main_menu_protein(protein_id)
        system 'clear'
        prompt.select("Main Menu") do |menu|
            Recipe.all.where(protein_id: protein_id).each do |recp|
                menu.choice recp.name.capitalize, -> {user_recipe_connection(recp.id)}
            end
            menu.choice "Change Protein", -> {choose_protein}
            menu.choice "Log Off", -> {exit_helper}
        end
    end

    def user_recipe_connection(recipe_id)
        if user.recipes.where(id: recipe_id) == Recipe.all.where(id: recipe_id)
            recipe_finder(recipe_id)
        else
            UserRecipe.create(name: self.user.name, user_id: self.user.id, recipe_id: recipe_id)
            recipe_finder(recipe_id)
        end
    end

    def recipe_finder(recipe_id)
        system 'clear'
        Recipe.all.select{|recipe| recipe.id == recipe_id}.each do |i|
            puts i.name.upcase
            puts "Rating: #{i.rating}"
            puts "Cooking Time: #{i.time} hours"
            puts "Difficulty Level: #{i.difficulty}"
            @recipe_ingredient = i.ingredient
        end
        prompt.select("What would you like to do?") do |menu|
            menu.choice "See ingredients", -> {recipe_ingredients(recipe_id)}
            menu.choice "Choose a different protein", -> {choose_protein}
            menu.choice "Exit", -> {exit_helper}
        end
    end
    
    def recipe_status_helper(recipe_id)
        system 'clear'
        Recipe.all.select{|recipe| recipe.id == recipe_id}.each do |i|
            puts i.name.upcase
            puts "Rating: #{i.rating}"
            puts "Cooking Time: #{i.time} hours"
            puts "Difficulty Level: #{i.difficulty}"
        end
    end

    def recipe_ingredients(recipe_id)
        recipe_status_helper(recipe_id)
        @recipe_ingredient_arr = recipe_ingredient.split(", ")
        puts " "
        p user.recipes.where(id: recipe_id)[0].ingredient
        prompt.select("Options") do |menu|
            menu.choice "Choose New Protein", -> {choose_protein}
            menu.choice "Update Recipe Rating", -> {update_recipe_rating(recipe_id)}
            menu.choice "Add Ingredient", -> {ingredient_add_helper(recipe_id)}
            menu.choice "Remove Ingredient", -> {ingredient_remove_helper(recipe_id)}
            menu.choice "Exit", -> {exit_helper}
        end
    end 

    def update_recipe_rating(recipe_id)
        new_rating = prompt.ask("what new rating would you like to give?")
        self.user.recipes.where(id: recipe_id).update(rating: new_rating.to_i)
        recipe_ingredients(recipe_id)
    end

    def ingredient_add_helper(recipe_id)
        added_ingredient = prompt.ask("What ingredient would you like to add")
        new_recipe_ingredient_arr = user.recipes.where(id: recipe_id)[0].ingredient.split(", ") << added_ingredient
        ingredient_change_helper(recipe_id, new_recipe_ingredient_arr)
    end 

    def ingredient_remove_helper(recipe_id)
        new_recipe_ingredient_arr = prompt.multi_select("Please choose from the list, ingredients you would like to keep") do |menu|
            menu.choices  user.recipes.where(id: recipe_id)[0].ingredient.split(", ")
        end
        ingredient_change_helper(recipe_id, new_recipe_ingredient_arr)
    end

    def ingredient_change_helper(recipe_id, new_recipe_ingredient_arr)
        user.recipes.where(id: recipe_id).update(ingredient: new_recipe_ingredient_arr.join(", "))
        recipe_ingredients(recipe_id)
    end

end 