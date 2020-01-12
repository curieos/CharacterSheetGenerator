class CharacterSheetGenerator::Class
	attr_reader :name, :level, :hit_die

	def initialize(_name, _hit_die)
		@name = _name
		@level = 1
		@hit_die = _hit_die
	end

	def level_up
		@level += 1
	end
end