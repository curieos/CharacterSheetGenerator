class CharacterSheetGenerator::Class
	attr_reader :name, :level, :hit_die

	def initialize(name, hit_die)
		@name = name
		@level = 1
		@hit_die = hit_die
	end
end