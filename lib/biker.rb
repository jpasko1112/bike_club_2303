class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(new_terrain)
    @acceptable_terrain << new_terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
      if @rides.key?(ride)
        @rides[ride] << time
      else
        @rides[ride] = [time]
      end
    else
      puts "Biker cannot log ride due to terrain or distance resitrctions"
    end
  end

  def personal_record(ride)
    require 'pry'; binding.pry
  end
end
# if @rides.key?(ride)
# ride_times = @rides[ride]
#   if ride_times.any?
#     ride_times.min
#   end
# end