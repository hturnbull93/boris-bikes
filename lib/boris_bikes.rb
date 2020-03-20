require_relative 'bike'

class DockingStation
  def initialize
    @storage = []
    @DEFAULT_CAPACITY = 20
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
    @storage.size >= @DEFAULT_CAPACITY
  end
  
  def empty?
    @storage.empty?
  end

end
