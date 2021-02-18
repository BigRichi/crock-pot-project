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
            #menu.choice "Protein", -> {choose_protein}
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
            puts "Incorrect Username or Password" #potentially add emoji's
            sleep(1.5)
            login_page
        end
    end

    def sign_up_helper
        username = prompt.ask("Enter Username")
        binding.pry
        # username = username.downcase
            # how do we make username downcase
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
            # protein.choice "Chicken", -> {main_menu_chicken}# -> something
            # protein.choice "Beef", -> {main_menu_beef}# -> something
            # protein.choice "Chicken", # -> something
            # protein.choice "Chicken", # -> something
            # protein.choice "Chicken", # -> something
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

    # def main_menu_chicken
    #     system 'clear'
    #     prompt.select("Main Menu for Chicken") do |menu|
    #         menu.choice "chicken noodle", -> {user_recipe_connection(2)}
    #         menu.choice "roast chicken", -> {user_recipe_connection(3)}
    #         menu.choice "change protein", -> {choose_protein}
    #         menu.choice "Log Off", -> {exit_helper}
    #     end
    # end

    def user_recipe_connection(recipe_id)
        UserRecipe.create(name: self.user.name, user_id: self.user.id, recipe_id: recipe_id)
        recipe_finder(recipe_id)
    end
    # ---- Recipe methods below ---- #

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

    def recipe_ingredients(recipe_id)
        @recipe_ingredient_arr = recipe_ingredient.split(", ")
        puts " "
        p recipe_ingredient_arr
        prompt.select("Options") do |menu|
            menu.choice "Choose New Protein", -> {choose_protein}
            menu.choice "Update Recipe Rating", -> {update_recipe_rating(recipe_id)}
            menu.choice "Add Ingredient", -> {ingredient_add_helper}
            menu.choice "Remove Ingredient", -> {ingredient_remove_helper}
            menu.choice "Exit", -> {exit_helper}
        end
    end 

    def update_recipe_rating(recipe_id)
        # binding.pry
        new_rating = prompt.ask("what new rating would you like to give?")
        self.user.recipes.where(id: recipe_id).update(rating: new_rating.to_i)
        p self.user.recipes.where(id: recipe_id)
        # binding.pry
    end

    def ingredient_add_helper
        added_ingredient = prompt.ask("what ingredient would you like to add")
        recipe_ingredient_arr << added_ingredient
        puts recipe_ingredient_arr
        # binding.pry
        # puts "What ingredient would you like to "

        # STDN.gets.chomp
    end 

    # user.recipie.ingredient.update(ingredient: added_ingredient)
    # def recipe_att
    #     recipe_finder
    # end
    
    # def chuck_roast_recipe
    # end
    
    # def chicken_noodle_recipe
    # end
    
    # def roast_chicken_recipe
    # end



end 


