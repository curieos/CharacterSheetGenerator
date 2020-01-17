class CharacterSheetGenerator::Character
	##
	# Total amount of hit points (not the current amount).
	attr_reader :hit_points
	attr_reader :name, :race, :classes, :abilities, :temp_hp, :experience, :alignment, :background, :personality_traits, :ideals, :bonds, :flaws

	##
	# Takes in the character's name, race, class, hp, alignment, and background.
	#
	# Optionally takes personality traits, ideals, bonds, and flaws.
	def initialize(_name, _class, _abilities, _hp, _alignment, _background, _personality_traits = "", _ideals = "", _bonds = "", _flaws = "")
		@name = _name
		@classes = []
		@classes << _class
		@abilities = _abilities

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

	##
	# Calculates a proficiency bonus based on the character's level
	def proficiency_bonus
		(level()+3)/4 + 1
	end

	##
	# Returns the current hp (including temporary hp).
	def current_hp
		@current_hp + temp_hp
	end

	##
	# Adds an amount of hp to the current amount. Your current hp can not be above the total hp.
	def heal(_amount)
		@current_hp += _amount
		@current_hp = @hit_points if @current_hp > @hit_points
	end

	##
	# Subtracts an amount of damage from the combined health pool, first taking from temporary hit points.
	#
	# Hit points can not drop below 0.
	#
	# Returns the amount of hit points you would have after damage. This includes negative hp.
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

	##
	# Gives the character temporary hp. This does not add the amount, it sets it.
	def gain_temp_hp(_amount)
		@temp_hp = _amount
	end

	##
	# Increases the xp counter.
	def gain_experience(_xp)
		@experience += _xp
	end

	##
	# Returns the level of the character, calculated from each class level.
	def level
		level = 0
		@classes.each do |_class|
			level += _class.level
		end
		level
	end

	##
	# Levels up a character
	# 
	# Takes an argument +_class+, which can either be a string or a class object (defaults to nil). If it passes a new class object, the character will add it to their list of classes. If it passes a string, it with either level up the class with name equal to the string if it exists, or it will level up the base class if the class is not found (or none is provided)
	#
	# Takes an argument +_additional_hp+, which is an int (defaults to 0). Adds this to hit point total.
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