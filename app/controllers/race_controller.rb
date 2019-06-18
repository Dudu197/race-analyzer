class RaceController < ApplicationController

	def index
	end

	def analyze
		@lines = File.read(race_params[:file].path)
		@race = Race.new
		@race.analyze(@lines.split("\n").drop(1))
	end

private

	def race_params
		params.require(:race).permit(:file)
	end
end
