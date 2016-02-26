User.create(first_name: "Bob", last_name: "Jones", email: "bobjones@gmail.com", password:"carrots")
User.create(first_name: "Jane", last_name: "Jones", email: "janejones@gmail.com", password:"carrots")
User.create(first_name: "Tom", last_name: "Jones", email: "tomjones@gmail.com", password:"carrots")
User.create(first_name: "Dan", last_name: "Jones", email: "danjones@gmail.com", password:"carrots")
User.create(first_name: "Julia", last_name: "Jones", email: "juliajones@gmail.com", password:"carrots")
User.create(first_name: "Mary", last_name: "Jones", email: "maryjones@gmail.com", password:"carrots")


tom = User.find(3)

#use Faker:: gem another time....



tomlist = tom.lists.create(title: "Is this working?")
tom.lists.create(title: "Second post")

tomlist.items.create(description: "First item for Tom", url: "https://google.com")
