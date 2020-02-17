require "net/http"
require 'json'

class CharacterSheetGenerator::Races
	def initialize(_url = "www.dnd5eapi.co")
		@url = _url
		response = Net::HTTP.get_response(_url, '/api/races')
		data = JSON.parse(response.body)
		@races = []
		data["results"].each do |_race|
			@races << JSON.parse(Net::HTTP.get_response(_url, _race["url"]).body)
		end
	end

	def list
		@races.collect do |_race|
			_race["name"]
		end
	end

	def get_race_by_index(index)
		@races[index]
	end
end