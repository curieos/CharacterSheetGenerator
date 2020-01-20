class CharacterSheetGenerator::Class
	attr_reader :name, :level, :hit_die, :features

	def initialize(_name, _hit_die, _features)
		@name = _name
		@level = 1
		@hit_die = _hit_die
		@features = _features
	end

	def level_up(_features: nil)
		_features.each do |feature|
			@features << feature
		end if _features != nil

		@level += 1
	end
end