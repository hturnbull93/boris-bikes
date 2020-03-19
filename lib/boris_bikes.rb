class DockingStation
  def initialize
    @storage = []
  end

  def release_bike
    fail "No bikes available." if @storage.empty?
    @storage.pop
  end

  def dock_bike(bike)
    fail "Dock full." if @storage.size == 20
    @storage << bike
  end

  attr_reader :storage
end

class Bike
  def working?
    true
  end
end
