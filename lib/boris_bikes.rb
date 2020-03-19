class DockingStation
  def initialize
    @storage = []
  end

  def release_bike
    fail "No bikes available." if empty?
    @storage.pop
  end

  def dock_bike(bike)
    fail "Dock full." if full?
    @storage << bike
  end

  attr_reader :storage

  private
  
  def full?
    @storage.size >= 20
  end
  
  def empty?
    @storage.empty?
  end

end

class Bike
  def working?
    true
  end
end
