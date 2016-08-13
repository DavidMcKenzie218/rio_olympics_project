class Nation

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i    
  end

end