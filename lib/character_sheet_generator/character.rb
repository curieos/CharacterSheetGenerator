class CharacterSheetGenerator::Character
	attr_reader :name, :classes

	def initialize(_name, _class = nil)
		@name = _name
		@classes = []
		@classes << _class if _class != nil
	end
end