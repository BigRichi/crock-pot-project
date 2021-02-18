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
richi = User.create(name: "richi", password: "123") 
nick = User.create(name: "nick", password: "123")
mo = User.create(name: "mo", password: "123")

#protein
beef = Protein.create(name: "beef")
chicken = Protein.create(name: "chicken")

#recipes
recipe1 = Recipe.create(name: "chuck roast", ingredient: "4 lbs chuck roast, 1 package Good Seasons Italian Dressing, 1 package Lipton Onion dry soup mix, 2-3 cans beef broth or enough to cover roast", difficulty: 3, time: 8, rating: 10, protein_id: beef.id)

recipe2 = Recipe.create(name: "chicken noodle", ingredient: "1 1/2 lb. boneless skinless chicken breasts, 1 large onion, 3 carrots, 2 stalks celery, 4 tsp. sprigs fresh thyme, 4 tsp. sprigs fresh rosemary, 3 cloves garlic, 1 bay leaf, Kosher salt, Freshly ground black pepper, 10 c. low-sodium chicken broth, 8 oz. egg noodles", difficulty: 4, time: 4, rating: 8, protein_id: chicken.id)

recipe3 = Recipe.create(name: "roast chicken", ingredient: "5 lb whole chicken neck and giblets removed, 1 tablespoon brown sugar, 2 teaspoons salt, 1 teaspoon pepper, 1/2 teaspoon garlic powder, 1/2 teaspoon onion powder, 1 tablespoon smoked paprika", difficulty: 2, time: 4, rating: 2, protein_id: chicken.id)

recipe4 = Recipe.create(name: "teriyaki beef", ingredient: "2 lbs. cubed beef stew meat, 1 cup Soy Vay Veri Veri Teriyaki sauce, 1 cup diced white onion, toasted sesame seeds, sliced green onion, steamed white or brown rice, broccoli or sugar snap peas", difficulty: 1, time: 6, rating: 7, protein_id: beef.id)

recipe5 = Recipe.create(name: "garlic-parmesan chicken", ingredient: "3 tbsp. extra-virgin olive oil, 2 lb. bone-in chicken thighs, Kosher salt, Freshly ground black pepper, 1 lb. baby red potatoes, 2 tbsp. butter, 5 cloves garlic, 2 tbsp. fresh thyme, Freshly chopped parsley, 2 tbsp. freshly grated Parmesan", difficulty: 4, time: 6, rating: 4, protein_id: chicken.id)

recipe6 = Recipe.create(name: "italian beef", ingredient: "3-4 lb beef roast, 1 teaspoon salt, 1/4 teaspoon black pepper, 1 package Italian dressing mix or garlic herb seasoning, 2 cups low sodium beef broth, 1 jar pepperoncini peppers with juice, 12 sub or hoagie rolls, 12 slices provolone", difficulty: 1, time: 6, rating: 7, protein_id: beef.id)

recipe7 = Recipe.create(name: "cheesy chicken spaghetti", ingredient: "1 large carrot peeled and shredded, 1/2 onion finely chopped, 1/2 green pepper chopped, 1/2 red pepper chopped, 1 teaspoon salt, 1 teaspoon minced garlic, 1/2 teaspoon paprika, 1/4 teaspoon black pepper, 2 1/2 cups low sodium chicken broth, 2 boneless skinless chicken breasts, 375 grams whole wheat spaghetti (1 small box), 3/4 cup 1% milk, 2 tablespoons corn starch, 2 cups shredded cheddar cheese", difficulty: 7, time: 6, rating: 6, protein_id: chicken.id)

recipe8 = Recipe.create(name: "creamy white chicken chili", ingredient: "1 lb boneless skinless chicken breasts trimmed of excess fat, 1 yellow onion diced, 2 cloves garlic minced, 24 oz. chicken broth, 2 15oz cans great Northern beans drained and rinsed, 2 4oz cans diced, green chiles, 1 15oz can whole kernel corn drained, 1 tsp salt, 1/2 tsp black pepper, 1 tsp cumin, 3/4 tsp oregano, 1/2 tsp chili powder
1/4 tsp cayenne pepper, small handful fresh cilantro chopped, 4 oz reduced fat cream cheese softened, 1/4 cup half and half", difficulty: 4, time: 8, rating: 7, protein_id: chicken.id)

recipe9 = Recipe.create(name: "mongolian beef with pineapple", ingredient: "1/2 cup plus 1 1/2 tablespoons corn starch divided, 1 teaspoon baking soda optional, 1/4 teaspoon salt, 1/4 teaspoon black pepper, 2 teaspoons canola oil, 1 1/2 lbs flank or sirloin steak sliced thinly, 1/2 cup low sodium soy sauce, 2/3 cup beef broth, 1/3 cup brown sugar packed, 2 tablespoons hoisin sauce, 1 tablespoon Thai sweet red chili sauce, 1 teaspoon minced garlic, 1 teaspoon fresh minced ginger, 1/4 cup reserved pineapple juice, 1 cup canned pineapple chunks drained and juice reserved, 1/2 cup matchstick carrots, green onions, hot cooked rice", difficulty: 3, time: 6, rating: 8, protein_id: beef.id)

recipe10 = Recipe.create(name: "honey balsamic beef stew", ingredient: "11 lb Little Potatoes, 1 lb stewing beef, 1 stalk celery finely chopped, 2 large carrots peeled and chopped, 1/2 medium onion finely chopped, 1/4 cup low sodium beef broth, 1/3 cup balsamic vinegar, 1/3 cup liquid honey, 2 tablespoons tomato paste, 1 tablespoon Worcestershire sauce, 2 teaspoons minced garlic, 1 teaspoon seasoning salt, 1/4 teaspoon black pepper, 2 tablespoons corn starch", difficulty: 6, time: 8, rating: 6, protein_id: beef.id)

# #user_recipes
# user_recipe1 = UserRecipe.create(name: "user_recipe1", user_id: max.id, recipe_id: recipe1.id)
# user_recipe2 = UserRecipe.create(name: "user_recipe2", user_id: richi.id, recipe_id: recipe2.id)
# user_recipe3 = UserRecipe.create(name: "user_recipe3", user_id: nick.id, recipe_id: recipe3.id)
# user_recipe4 = UserRecipe.create(name: "user_recipe4", user_id: mo.id, recipe_id: recipe4.id)

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