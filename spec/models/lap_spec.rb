require 'rails_helper'

RSpec.describe Lap, type: :model do
	before do
		@lap = Lap.new
		@lap.time = Time.strptime("23:49:08.277", "%H:%M:%S.%N")
		@lap.pilot_id = "038"
		@lap.pilot_name = "F.MASSA"
		@lap.lap_number = "1"
		@lap.lap_time = Time.strptime("1:02.852", "%M:%S.%N")
		@lap.average_speed = 44.275
	end

  	describe "test lap_time_in_seconds" do
  		# Time = 1:02.852
  		# 1 minute in seconds = 60
  		# + 02 seconds = 62
  		# + .852 = 62.852
  		# The method sould return a Rational number
  		# so, make sure to convert to float to compare
  		it "test method should return 62.852" do
  			expect(@lap.lap_time_in_seconds.to_f).to eq(62.852)
  		end
	end

	describe "test lap_time_to_string" do
		it "method should return '01:02.852'" do
			expect(@lap.lap_time_to_string).to eq("01:02.852")
		end
	end
end
