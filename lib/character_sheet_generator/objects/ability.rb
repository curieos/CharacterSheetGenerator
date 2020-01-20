class CharacterSheetGenerator::Ability
	attr_reader :name, :base_score, :bonus_score, :skills

	def initialize(_name, _base, _bonus, _skills)
		@name = _name
		@base_score = _base
		@bonus_score = _bonus
		@skills = _skills
	end

	def score
		@base_score + @bonus_score
	end

	def modifier
		score()/2 - 5
	end

	def skill_bonus(_skill, _proficency_bonus)
		modifier() + @skills[_skill.to_sym]*_proficency_bonus if @skills[_skill.to_sym]
	end
end