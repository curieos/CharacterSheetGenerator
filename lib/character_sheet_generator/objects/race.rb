class CharacterSheetGenerator::Race
	attr_reader :name, :speed, :subrace, :features

	def initialize(_name, _speed, _features, _subrace: nil)
		@name = _name
		@subrace = _subrace if _subrace != nil

		@speed = _speed
		@features = _features
	end
end