# THIS SEED FILE NEEDS TO BE ENTIRELY REPLACED -- I'M LEAVING CODE FOR YOUR REFERENCE ONLY!
UserRecipe.destroy_all
Recipe.destroy_all
Protein.destroy_all
User.destroy_all
UserRecipe.reset_pk_sequence
Recipe.reset_pk_sequence
Protein.reset_pk_sequence
User.reset_pk_sequence

#users
max = User.create(name: "max", password: "123")
richi = User.create(name: "richi", password: "123" ) 
nick = User.create(name: "nick", password: "123")
mo = User.create(name: "mo", password: "123")

#protein
beef = Protein.create(name: "beef")
chicken = Protein.create(name: "chicken")

#recipes
recipe1 = Recipe.create(name: "chuck roast", ingredient: "beef", difficulty: 3, time: 8, rating: 10, protein_id: beef.id)
recipe2 = Recipe.create(name: "chicken noodle", ingredient: "chicken", difficulty: 4, time: 4, rating: 8, protein_id: chicken.id)
recipe3 = Recipe.create(name: "roast chicken", ingredient: "chicken", difficulty: 2, time: 4, rating: 2, protein_id: chicken.id)
recipe4 = Recipe.create(name: "teriyaki beef", ingredient: "beef", difficulty: 1, time: 6, rating: 7, protein_id: beef.id)

#user_recipes
user_recipe1 = UserRecipe.create(name: "user_recipe1", user_id: max.id, recipe_id: recipe1.id)
user_recipe2 = UserRecipe.create(name: "user_recipe2", user_id: richi.id, recipe_id: recipe2.id)
user_recipe3 = UserRecipe.create(name: "user_recipe3", user_id: nick.id, recipe_id: recipe3.id)
user_recipe4 = UserRecipe.create(name: "user_recipe4", user_id: mo.id, recipe_id: recipe4.id)

# Plant.destroy_all
# Person.destroy_all
# PlantParenthood.destroy_all
# Plant.reset_pk_sequence
# Person.reset_pk_sequence
# PlantParenthood.reset_pk_sequence

# ########### different ways to write your seeds ############

# # 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)

# # 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
# ## a. by passing an array of hashes:
# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}

# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🔥 🔥 🔥 🔥 "