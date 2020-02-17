require "net/http"
require 'json'

class CharacterSheetGenerator::Classes
	def initialize(_url = "www.dnd5eapi.co")
		@url = _url
		response = Net::HTTP.get_response(_url, '/api/classes')
		data = JSON.parse(response.body)
		@classes = []
		data["results"].each do |_class|
			@classes << JSON.parse(Net::HTTP.get_response(_url, _class["url"]).body)
		end
	end

	def list
		@classes.collect do |_class|
			_class["name"]
		end
	end

	def get_class_by_index(index)
		@classes[index]
	end
end