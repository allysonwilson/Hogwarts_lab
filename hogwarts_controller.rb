require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require('./models/student')
require('./models/house')

#index
get '/students' do
  @students = Student.all( )
  erb(:index)
end
#new
get '/students/new' do
  @houses = House.all( )
  erb(:new)
end
#create
post '/students' do
  @students = Student.new( params )
  @students.save()
  erb(:create)
end
#show
  get '/students/:id' do
    @students = Student.find( params[:id] )
    erb(:show)
  end
#delete
  post '/students/:id/delete' do
    @students = Student.find( params[:id])
    @students.delete()
    redirect to '/students'
  end
#edit
  get '/students/:id/edit' do
    @students = Student.find( params[:id])
    @students.update()
    erb(:edit)
  end
#update
  post '/students/:id' do
    puts params
    student = Student.new( params[:id] )
    student.update()
    redirect to "/students/#{student.id}"
  end
