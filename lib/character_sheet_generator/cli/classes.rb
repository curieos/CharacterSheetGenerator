require "net/http"

class CharacterSheetGenerator::Classes
	def initialize(url = "https://www.dnd5eapi.co/api/")
		@url = "#{url}classes/"
		
	end
end