class Todo
  attr_accessor :id, :body, :complete

  def initialize(attributes={})
    @id = attributes['id']
    @body = attributes['body']
    @complete = attributes['complete'] || false
  end

  def complete?
    complete == 't'
  end

  def save
    sql = 'INSERT INTO todos (body, complete) VALUES ($1, $2) RETURNING *'

    Database.exec(sql, [body, complete])

    self
  end

  def self.all
    sql = 'SELECT * FROM todos'

    results = Database.exec(sql)

    results.map { |attributes| new(attributes) }
  end

  def self.create(attributes)
    todo = new(attributes)
    todo.save
  end
end
