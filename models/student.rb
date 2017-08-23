require_relative('../db/sql_runner')

class Student

    attr_accessor :id, :first_name, :last_name, :house_id, :age

  def initialize(student_array)
    @id = student_array['id'].to_i
    @first_name = student_array['first_name']
    @last_name = student_array['last_name']
    @house_id = student_array['house_id']
    @age = student_array['age'].to_i
  end

  def house()
    sql = 'SELECT * FROM houses
    WHERE id = $1;'
    result_array = SqlRunner.run( sql, [@house_id])
    house_hash = result_array[0]
    house_object = House.new(house_hash)
    return house_object
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house_id,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def delete()
    sql = 'DELETE FROM students WHERE id =$1;'
    SqlRunner.run(sql, [@id])
  end

  def self.delete_all()
    sql = 'DELETE FROM students;'
    SqlRunner.run(sql, [])
  end

  def self.all()
      sql = "SELECT * FROM students"
      values = []
      students = SqlRunner.run( sql, values )
      result = students.map { |student| Student.new( student) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM students WHERE id = $1"
      values = [id]
      student = SqlRunner.run( sql, values )
      result = Student.new( student.first )
      return result
    end

  def update()
    sql = "UPDATE students
    SET
    (
      first_name,
      last_name,
      house_id,
      age

    ) =
    (
      $1, $2, $3, $4
    )
  WHERE id = $5"
  values = [@first_name, @last_name, @house_id,
    @age]
  SqlRunner.run( sql, values )
end

def delete()
  sql = "DELETE FROM students
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

end
