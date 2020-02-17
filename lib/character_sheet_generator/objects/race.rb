class CharacterSheetGenerator::Race
	attr_reader :name, :subrace, :speed, :size, :features

	def initialize(_name, _speed, _size, _features, _subrace: nil)
		@name = _name
		@subrace = _subrace if _subrace != nil

		@speed = _speed
		@size = _size
		@features = _features
	end

	def self.new_from_hash(hash)
		features = []
		CharacterSheetGenerator::Race.new(hash["name"], hash["speed"], hash["size"], features)
	end
end