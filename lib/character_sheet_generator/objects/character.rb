class CharacterSheetGenerator::Character
	##
	# Total amount of hit points (not the current amount).
	attr_reader :hit_points
	attr_reader :name, :race, :classes, :abilities, :feats, :temp_hp, :experience, :alignment, :background, :currency,
		:personality_traits, :ideals, :bonds, :flaws, :height, :weight, :age, :eyes, :skin, :hair

	##
	# Takes in the character's name, race, class, abilities, equipment, hp, alignment, and background.
	#
	# Optionally takes personality traits, ideals, bonds, and flaws.
	def initialize(_name, _race, _class, _abilities, _equipment, _hp, _alignment, _background, _currency: {},
		_personality_traits: "", _ideals: "", _bonds: "", _flaws: "", _height: "", _weight: "", _age: "", _eyes: "", _skin: "", _hair: "")

		@name = _name
		@race = _race
		@classes = []
		@classes << _class
		@abilities = _abilities
		@feats = []

		@currency = {}
		@currency[:copper] = _currency.fetch(:copper, 0)
		@currency[:silver] = _currency.fetch(:silver, 0)
		@currency[:gold] = _currency.fetch(:gold, 0)
		@currency[:electrum] = _currency.fetch(:electrum, 0)
		@currency[:platinum] = _currency.fetch(:platinum, 0)

		@equipment = _equipment

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
		@height = _height
		@weight = _weight
		@age = _age
		@eyes = _eyes
		@skin = _skin
		@hair = _hair
	end

	def speed
		race.speed
	end

	def size
		@race.size
	end

	##
	# Returns an Array of all features (including feats)
	def features
		collection = []
		classes.each do |_class|
			_class.features.each do |feature|
				collection << feature
			end
		end
		race.features.each do |feature|
			collection << feature
		end
		feats.each do |feat|
			collection << feat
		end
		collection
	end

	##
	# Takes in the ability's name of type String and returns the ability's score (or nil if it's not found)
	def ability_score(_ability)
		score = nil
		score = @abilities.find { |ability| ability.name == _ability }.score if @abilities.find { |ability| ability.name == _ability }
	end

	##
	# Takes in the ability's name of type String and returns the ability's modifier (or nil if it's not found)
	def ability_modifier(_ability)
		modifier = nil
		modifier = @abilities.find { |ability| ability.name == _ability }.modifier if @abilities.find { |ability| ability.name == _ability }
	end

	##
	# Takes in the ability's name of type String and returns the saving throw modifier (or nil if it's not found)
	def saving_throw(_ability)
		saving_throw = nil
		saving_throw = @abilities.find { |ability| ability.name == _ability }.saving_throw(proficiency_bonus) if @abilities.find { |ability| ability.name == _ability }
	end

	##
	# Takes in the skill's name of type String and returns the skill bonus (or nil if it's not found)
	def skill_bonus(_skill)
		bonus = nil
		@abilities.each do |ability|
			b = ability.skill_bonus(_skill, proficiency_bonus)
			bonus = b if b != nil
		end
		bonus
	end

	##
	# Calculates a proficiency bonus based on the character's level
	def proficiency_bonus
		(level()+3)/4 + 1
	end

	##
	#
	def add_currency(_amount)
		@currency[:copper] += _amount.fetch(:copper, 0)
		@currency[:silver] += _amount.fetch(:silver, 0)
		@currency[:gold] += _amount.fetch(:gold, 0)
		@currency[:electrum] += _amount.fetch(:electrum, 0)
		@currency[:platinum] += _amount.fetch(:platinum, 0)
	end

	##
	# 
	def spend_currency(_amount) # not how this method should be done, idc right now
		@currency[:copper] -= _amount.fetch(:copper, 0)
		@currency[:silver] -= _amount.fetch(:silver, 0)
		@currency[:gold] -= _amount.fetch(:gold, 0)
		@currency[:electrum] -= _amount.fetch(:electrum, 0)
		@currency[:platinum] -= _amount.fetch(:platinum, 0)
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
	def level_up(_class: nil, _additional_hp: 0, _feat: nil)
		if _class.is_a?(String)
			found_class = @classes.find{ |i| i.name == _class }
			found_class.level_up() if found_class
			_class = nil if !found_class
		end
		@classes << _class if _class.is_a?(CharacterSheetGenerator::Class)
		@classes[0].level_up() if _class == nil

		@feats << _feat if _feat != nil

		@hit_points += _additional_hp
	end
end