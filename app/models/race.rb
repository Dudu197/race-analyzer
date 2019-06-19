class Race
	attr_accessor :file, :laps, :results, :best_lap

	def analyze(data)
		self.laps = []
		self.results = []
		data = trim_laps(data)
		data.each do |current_lap|
			current_lap = current_lap.split(" ")
			lap = Lap.new
			lap.time = Time.strptime(current_lap[0], "%H:%M:%S.%N")
			lap.pilot_id = current_lap[1]
			lap.pilot_name = current_lap[3]
			lap.lap_number = current_lap[4]
			lap.lap_time = Time.strptime(current_lap[5], "%M:%S.%N")
			lap.average_speed = (current_lap[6].sub(',', '.')).to_f
			self.laps << lap
		end

		group = self.laps.group_by { |i| i.pilot_id }



		ordered = group.sort_by {|key, element|
			element.max_by(&:time).time
		}

		first_place_time = ordered.first.last.sum(&:lap_time_in_seconds)
		self.best_lap = self.laps.min_by(&:lap_time)

		ordered.each_with_index do |race_laps, position|
			race_laps = race_laps.last
			result = RaceResult.new
			result.position = position + 1
			result.pilot_id = race_laps.first.pilot_id
			result.pilot_name = race_laps.first.pilot_name
			result.laps_number = race_laps.count

			result.race_time = seconds_to_string(race_laps.sum(&:lap_time_in_seconds))

			best_lap = race_laps.min_by(&:lap_time)
			result.best_lap = best_lap

			result.ref_time = seconds_to_string(race_laps.sum(&:lap_time_in_seconds)- first_place_time)

			result.average_speed = ((race_laps.map { |e| e.average_speed }.sum) / race_laps.count).round(2)

			self.results << result
		end
	end

	def trim_laps(laps)
		max_laps = 4
		lap_index = 4
		laps.select { |e| e.split(" ")[lap_index].to_i <= max_laps }
	end

	def seconds_to_string(seconds)
		Time.at(seconds).utc.strftime("%M:%S.%3N")
	end

end
