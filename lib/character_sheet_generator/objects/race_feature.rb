class CharacterSheetGenerator::RaceFeature < CharacterSheetGenerator::Feature
	def initialize(_name, _description)
		super(_name, _description)
		@source = "Race"
	end
end