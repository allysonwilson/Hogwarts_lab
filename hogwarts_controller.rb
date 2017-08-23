require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require('./models/student')
require('./models/house')

get '/students' do
  @students = Student.all( )
  erb(:index)
end

get '/students/new' do
  @houses = House.all( )
  erb(:new)
end

post '/students' do
  @students = Student.new( params )
  @students.save()
  erb(:create)
end
