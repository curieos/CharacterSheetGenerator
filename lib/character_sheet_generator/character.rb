class CharacterSheetGenerator::Character
	attr_reader :name, :classes

	def initialize(_name, _class)
		@name = _name
		@classes = []
		@classes << _class
	end
end