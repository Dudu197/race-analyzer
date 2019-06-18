class Race
	attr_accessor :file, :laps, :results, :best_lap

	def analyze(data)
		self.laps = []
		self.results = []
		data.each do |current_lap|
			current_lap = current_lap.split(" ")
			lap = Lap.new
			lap.time = Time.parse(current_lap[0])
			lap.pilot_id = current_lap[1]
			lap.pilot_name = current_lap[3]
			lap.lap_number = current_lap[4]
			lap.lap_time = Time.parse(current_lap[5])
			lap.average_speed = (current_lap[6].sub(',', '.')).to_f
			self.laps << lap
		end

		group = self.laps.group_by { |i| i.pilot_id }



		ordered = group.sort_by {|key, element|
			element.max_by(&:time).time
		}

		first_place_time = ordered.first.last.max_by(&:time).time
		self.best_lap = self.laps.min_by(&:lap_time)

		ordered.each_with_index do |race_laps, position|
			race_laps = race_laps.last
			result = RaceResult.new
			result.position = position + 1
			result.pilot_id = race_laps.first.pilot_id
			result.pilot_name = race_laps.first.pilot_name
			result.laps_number = race_laps.count

			result.race_time = minutes_to_string(race_laps.sum(&:lap_time_in_minutes))

			best_lap = race_laps.min_by(&:lap_time)
			result.best_lap = best_lap.lap_number

			result.ref_time = minutes_to_string(race_laps.last.time - first_place_time)

			result.average_speed = (race_laps.map { |e| e.average_speed }.sum) / race_laps.count

			self.results << result
		end

	end

	def minutes_to_string(minutes)
		Time.at(minutes * 60).utc.strftime("%H:%M:%S")
	end

end
