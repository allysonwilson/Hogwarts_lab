require('pry-byebug')
require_relative('../models/student')



student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => "11"
  })
student1.save()

  student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house" => "Gryffindor",
  "age" => "11"
  })
  student2.save()

  student3 = Student.new({
    "first_name" => "Draco",
    "last_name" => "Malfoy",
    "house" => "Slytherin",
    "age" => "11"
    })
    student3.save()

binding.pry
nils
