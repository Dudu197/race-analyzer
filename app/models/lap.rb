class Lap
	attr_accessor :time, :pilot_id, :pilot_name, :lap_number, :lap_time, :average_speed

	def lap_time_in_seconds
		return (lap_time.min * 60) + lap_time.sec + lap_time.sec_fraction
	end

	def lap_time_to_string
		lap_time.strftime("%M:%S.%3N")
	end
end
