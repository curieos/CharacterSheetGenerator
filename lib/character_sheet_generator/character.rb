class CharacterSheetGenerator::Character
	attr_reader :name, :race, :classes, :experience

	def initialize(_name, _class)
		@name = _name
		@classes = []
		@classes << _class

		@experience = 0
	end

	def gain_experience(_xp)
		@experience += _xp
	end

	def level
		level = 0
		@classes.each do |_class|
			level += _class.level
		end
		level
	end

	def level_up(_class: nil)
		if _class.is_a?(String)
			found_class = @classes.find{ |i| i.name == _class }
			found_class.level_up() if found_class
			_class = nil if !found_class
		end
		@classes << _class if _class.is_a?(CharacterSheetGenerator::Class)
		@classes[0].level_up() if _class == nil
	end
end