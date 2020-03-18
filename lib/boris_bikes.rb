class DockingStation
  def initialize
    @capacity = 20
  end

  def release_bike
    fail "No bikes available." unless @bike
    @bike
  end

  def dock_bike(bike)
    fail "Dock full." if @bikes_docked == 1
    @bikes_docked = 1
    @bike = bike
  end

  attr_reader :bike, :capacity
end

class Bike
  def working?
    true
  end
end
