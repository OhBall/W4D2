# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



birth_dates = ['2050-12-05', '1993-04-23', '1990-04-27']
colors = ['Green', 'Calico', 'Blue']
names = ['Tickles', 'Chairman Meow', 'Pickles']
sexes = ['M', 'F', 'M']
descriptions = ['Very ticklish cat that loves milk and yarn',
'Representative of the kitties playhouse thing',
'Brind #no cumbers']

Cat.destroy_all

i = 0
while i < 3
  Cat.create(color: colors[i], birth_date: birth_dates[i], name: names[i], sex: sexes[i], description: descriptions[i])
  i+=1
end
