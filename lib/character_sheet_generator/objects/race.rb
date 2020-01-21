class CharacterSheetGenerator::Race
	attr_reader :name, :subrace, :features

	def initialize(_name, _features, _subrace: nil)
		@name = _name
		@subrace = _subrace if _subrace != nil
		@features = _features
	end
end