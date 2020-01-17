require "net/http"

class CharacterSheetGenerator::Classes
	def initialize(_url = "https://www.dnd5eapi.co/api/")
		@url = "#{_url}classes/"
		
	end
end