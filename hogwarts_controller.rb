require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require('./models/student')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @students = Student.new( params )
  @students.save()
  erb(:create)
end
