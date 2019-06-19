require 'rails_helper'

RSpec.describe Race, type: :model do
  before do
  		@example_laps = File.read("#{Rails.root}/public/example.txt").split("\n").drop(1)
  		@example_5_laps = File.read("#{Rails.root}/public/example3.txt").split("\n").drop(1)
		@race = Race.new
		# @race.analyze(@lines.split("\n").drop(1))
  end

  describe "test trim_laps" do
  	it "should not return laps after fourth lap" do
  		laps = @race.trim_laps(@example_5_laps)
  		laps = laps.map { |e| e.split(" ")[4].to_i }
  		expect(laps).to all(be <= 4)
  	end
  end

  describe "test seconds_to_string" do
  	it "should return '01:13.459'" do
  		expect(@race.seconds_to_string(73.459)).to eq("01:13.459")
  	end
  end

  describe "test analyze" do
  	before do
  		@race.analyze @example_laps
  	end

  	it "should select the correct best lap" do
  		expect(@race.best_lap).to have_attributes({
  			time: Time.strptime("23:51:14.216", "%H:%M:%S.%N"),
  			pilot_id: "038",
  			pilot_name: "F.MASSA",
			lap_number: "3",
			lap_time: Time.strptime("1:02.769", "%M:%S.%N"),
			average_speed: 44.334
  		})
  	end

  	it "should have 23 computed laps" do
  		expect(@race.laps.count).to be 23
  	end

  	it "should have de correct result" do
  		expect(@race.results[0]).to have_attributes({
  			position: 1,
			pilot_id: "038",
			pilot_name: "F.MASSA",
			laps_number: 4,
			race_time: "04:11.578",
			best_lap: @race.laps[10],
			average_speed: 44.25,
			ref_time: "00:00.000"
   		})

  		expect(@race.results[1]).to have_attributes({
  			position: 2,
			pilot_id: "002",
			pilot_name: "K.RAIKKONEN",
			laps_number: 4,
			race_time: "04:15.153",
			best_lap: @race.laps[18],
			average_speed: 43.63,
			ref_time: "00:03.575"
   		})

  		expect(@race.results[2]).to have_attributes({
  			position: 3,
			pilot_id: "033",
			pilot_name: "R.BARRICHELLO",
			laps_number: 4,
			race_time: "04:16.080",
			best_lap: @race.laps[11],
			average_speed: 43.47,
			ref_time: "00:04.502"
   		})

  		expect(@race.results[3]).to have_attributes({
  			position: 4,
			pilot_id: "023",
			pilot_name: "M.WEBBER",
			laps_number: 4,
			race_time: "04:17.722",
			best_lap: @race.laps[19],
			average_speed: 43.19,
			ref_time: "00:06.144"
   		})

  		expect(@race.results[4]).to have_attributes({
  			position: 5,
			pilot_id: "015",
			pilot_name: "F.ALONSO",
			laps_number: 4,
			race_time: "04:54.221",
			best_lap: @race.laps[9],
			average_speed: 38.07,
			ref_time: "00:42.643"
   		})

  		expect(@race.results[5]).to have_attributes({
  			position: 6,
			pilot_id: "011",
			pilot_name: "S.VETTEL",
			laps_number: 3,
			race_time: "06:27.276",
			best_lap: @race.laps[22],
			average_speed: 25.75,
			ref_time: "02:15.698"
   		})
  	end
  end
end
