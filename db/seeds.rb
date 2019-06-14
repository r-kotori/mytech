10.times do |i|
  User.create(name:i, email: "test#{i}@gmail.com", password: "ffffff", password_confirmation: "ffffff")
end
