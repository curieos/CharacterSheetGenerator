class CharacterSheetGenerator::Character
	attr_reader :name, :race, :classes, :hit_points, :temp_hp, :experience, :alignment, :background, :personality_traits, :ideals, :bonds, :flaws

	def initialize(_name, _class, _hp, _alignment, _background, _personality_traits = "", _ideals = "", _bonds = "", _flaws = "")
		@name = _name
		@classes = []
		@classes << _class

		@hit_points = _hp
		@current_hp = @hit_points
		@temp_hp = 0
		@experience = 0

		@alignment = _alignment
		@background = _background
		@personality_traits = _personality_traits
		@ideals = _ideals
		@bonds = _bonds
		@flaws = _flaws
	end

	def current_hp
		@current_hp + temp_hp
	end

	def heal(_amount)
		@current_hp += _amount
		@current_hp = @hit_points if @current_hp > @hit_points
	end

	def take_damage(_amount)
		@temp_hp -= _amount
		if (temp_hp < 0)
			@current_hp += @temp_hp
			@temp_hp = 0
		end
		leftover = @current_hp
		@current_hp = 0 if @current_hp < 0
		leftover
	end

	def gain_temp_hp(_amount)
		@temp_hp = _amount
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

	def level_up(_class: nil, _additional_hp: 0)
		if _class.is_a?(String)
			found_class = @classes.find{ |i| i.name == _class }
			found_class.level_up() if found_class
			_class = nil if !found_class
		end
		@classes << _class if _class.is_a?(CharacterSheetGenerator::Class)
		@classes[0].level_up() if _class == nil
		@hit_points += _additional_hp
	end
end