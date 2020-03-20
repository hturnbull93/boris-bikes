require_relative 'bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
    @storage.size >= @capacity
  end
  
  def empty?
    @storage.empty?
  end

end
