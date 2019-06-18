class Lap
	attr_accessor :time, :pilot_id, :pilot_name, :lap_number, :lap_time, :average_speed

	def lap_time_in_minutes
		return lap_time.hour * 60 + lap_time.min + lap_time.sec / 60
	end
end
