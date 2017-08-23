require_relative('../db/sql_runner')

class Student

    attr_accessor :id, :first_name, :last_name, :house, :age

  def initialize(student_array)
    @id = student_array['id'].to_i
    @first_name = student_array['first_name']
    @last_name = student_array['last_name']
    @house = student_array['house']
    @age = student_array['age'].to_i
  end

  def save()
    sql = "INSERT INTO hogwarts
    (
      first_name,
      last_name,
      house,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @house, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.all()
      sql = "SELECT * FROM hogwarts"
      values = []
      students = SqlRunner.run( sql, values )
      result = students.map { |student| Student.new( student) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM hogwarts WHERE id = $1"
      values = [id]
      student = SqlRunner.run( sql, values )
      result = Student.new( student.first )
      return result
    end


end
