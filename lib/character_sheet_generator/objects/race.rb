class CharacterSheetGenerator::Race
	attr_reader :name, :subrace

	def initialize(_name, _subrace: nil)
		@name = _name
		@subrace = _subrace if _subrace != nil
	end
end