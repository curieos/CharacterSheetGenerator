class CharacterSheetGenerator::Feature
	attr_reader :name, :description, :source

	def initialize(_name, _description)
		@name = _name
		@description = _description
	end
end