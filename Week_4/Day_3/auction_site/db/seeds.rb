1.upto(25) do |index|
  user = User.create(
  name: "User #{index}",
  email: "#{index}@gmail.com"
  )

  user.products.create(
  title: "Product #{index}",
  description: "This is the product #{index}",
  deadline: Date.today + rand(5).days,
  )

end
