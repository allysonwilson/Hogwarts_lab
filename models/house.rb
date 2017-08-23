require_relative('../db/sql_runner')
class House
attr_accessor :id, :name

def initialize(house)
  @id = house['id'].to_i
  @name = house['name']
end

def save()
  sql = "INSERT INTO houses
  (
    name
  )
  VALUES
  (
    $1
  )
  RETURNING *"
  values = [@name]
  house_data = SqlRunner.run(sql, values)
  @id = house_data.first()['id'].to_i
end


def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run( sql, values )
    result = houses.map { |house| House.new( house) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

  def delete()
    sql = 'DELETE FROM houses WHERE id =$1;'
    SqlRunner.run(sql, [@id])
  end

  def self.delete_all()
    sql = 'DELETE FROM houses;'
    SqlRunner.run(sql, [])
  end

end
