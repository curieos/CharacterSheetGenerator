class CharacterSheetGenerator::ClassFeature < CharacterSheetGenerator::Feature
	def initialize(_name, _description)
		super(_name, _description)
		@source = "Class"
	end
end