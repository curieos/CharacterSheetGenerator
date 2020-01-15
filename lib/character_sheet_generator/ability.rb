class CharacterSheetGenerator::Ability
	attr_reader :name, :base_score, :bonus_score

	def initialize(_name, _base, _bonus)
		@name = _name
		@base_score = _base
		@bonus_score = _bonus
	end

	def score
		@base_score + @bonus_score
	end
end