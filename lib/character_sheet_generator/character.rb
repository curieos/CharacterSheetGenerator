class CharacterSheetGenerator::Character
	attr_reader :name, :classes

	def initialize(_name, _class)
		@name = _name
		@classes = []
		@classes << _class
	end

	def level
		level = 0
		@classes.each do |_class|
			level += _class.level
		end
		level
	end

	def level_up(_class = nil)
		@classes << _class if _class.is_a?(CharacterSheetGenerator::Class)
		@classes[0].level_up() if _class == nil
	end
end