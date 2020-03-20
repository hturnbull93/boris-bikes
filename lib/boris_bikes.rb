require_relative 'bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @storage = []
  end

  def release_bike
    fail 'No bikes available.' if empty?
    fail 'No working bikes.' unless @storage.last.working?
    @storage.pop
  end

  def dock_bike(bike, broken? = false)
    fail 'Dock full.' if full?
    @storage << bike
    bike.mark_broken if broken?
    @storage
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
