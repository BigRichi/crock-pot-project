class Interface

    attr_reader :prompt, :protein
    attr_accessor :user


    def initialize
        @prompt = TTY::Prompt.new
    end 

    def welcome
        system 'clear'
        #do logo later
        puts "Hello and welcome to crockpot recipe finder"
        sleep(2)
        login_page
    end 

    def login_page
        prompt.select("Login or Sign up") do |menue|
            menue.choice "Login", -> {login_helper}
            menue.choice "Sign up", -> {sign_up_helper}
            menue.choice "Exit", -> {exit_helper}
        end
    end

    def login_helper
        username = prompt.ask("Enter Username")
        password = prompt.ask("Enter Password")
        if User.find_by(name: username, password: password)
            self.user = User.find_by(name: username, password: password)
            # no music yet
            puts "Let's Get Cookin #{self.user.name.upcase}!!!"
            sleep(1.5)
            choose_protein
        else
            puts "Incorrect Username or Password" #potentially add emoji's
            sleep(1.5)
            login_page
        end
    end

    def sign_up_helper
        username = prompt.ask("Enter Username")
        # username = username.downcase
            # how do we make username downcase
        while User.find_by(name: username)
            puts "This username is already taken, please create a different username"
            username = prompt.ask("Enter Username")
        end
        password = prompt.ask("Enter Password")
        self.user = User.create(name: username, password: password)
        puts "Sign up complete."
        sleep(0.8)
        puts "Let's Get Cookin #{self.user.name.upcase}!!!"
        sleep(1.5)
        choose_protein
    end

    def exit_helper
        puts "Goodbye"
        sleep(2)
        system 'clear'
    end

    def choose_protein
        system 'clear'
        prompt.select("What protein will you be having today?") do |protein|
            protein.choice "Chicken", -> {main_menue_chicken}# -> something
            protein.choice "Beef", -> {main_menue_beef}# -> something
            # protein.choice "Chicken", # -> something
            # protein.choice "Chicken", # -> something
            # protein.choice "Chicken", # -> something
        end
    end

    def main_menue_beef
        system 'clear'
        prompt.select("Main Menu for Beef") do |menu|
            menu.choice "teriyaki beef", -> {teriyaki_beef_recipe}
            menu.choice "chuck roast", -> {chuch_roast_recipe}
            menu.choice "change protein", -> {choose_protein}
            menu.choice "Log Off", -> {exit_helper}
        end
    end

    def main_menue_chicken
        system 'clear'
        prompt.select("Main Menu for Chicken") do |menu|
            menu.choice "chicken noodle", -> {chicken_noodle_recipe}
            menu.choice "roast chicken", -> {roast_chicken_recipe}
            menu.choice "change protein", -> {choose_protein}
            menu.choice "Log Off", -> {exit_helper}
        end
    end

    # ---- Recipe methods below ---- #

    def teriyaki_beef_recipe
    end
    
    def chuch_roast_recipe
    end
    
    def chicken_noodle_recipe
    end
    
    def roast_chicken_recipe
    end



end 

