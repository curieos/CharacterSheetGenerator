RSpec.describe "Character" do
	let(:dummy_class) { CharacterSheetGenerator::Class.new("Dummy Class", 10) }
	let(:dummy_character) { CharacterSheetGenerator::Character.new("Dummy Name", dummy_class, 5) }

	it "exists" do
		expect(dummy_character).to_not be_nil
	end

	it "has a name" do
		dummy_name = "Tim"
		new_character = CharacterSheetGenerator::Character.new(dummy_name, dummy_class, 5)

		expect(new_character.name).to eq(dummy_name)
	end

	it "has 0 experience on init" do
		expect(dummy_character.experience).to eq(0)
	end

	it "can gain experience" do 
		xp = 100
		xp2 = 1000

		dummy_character.gain_experience(xp)

		expect(dummy_character.experience).to eq(xp)

		dummy_character.gain_experience(xp2)

		expect(dummy_character.experience).to eq(xp + xp2)
	end

	describe "#class" do
		it "exists" do
			new_class = CharacterSheetGenerator::Class.new("new class", 10)
			new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

			expect(new_character.classes).to include(new_class)
		end
	end

	describe "#hit_points" do
		it "has a starting hp" do
			expect(dummy_character.hit_points).to eq(5)
		end

		it "has a #current_hp method" do
			expect(dummy_character.current_hp).to eq (5)
		end

		it "has #temp_hp" do
			expect(dummy_character.temp_hp).to_not be_nil
		end

		it "can gain temporary hp" do
			new_class = CharacterSheetGenerator::Class.new("new class", 10)
			new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

			new_character.gain_temp_hp(5)

			expect(new_character.current_hp).to eq(10)
		end
	end

	describe "level methods" do
		it "has a #level method that totals class levels" do
			new_class = CharacterSheetGenerator::Class.new("new class", 10)
			new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

			expect(new_character.level).to eq(1)
		end

		describe "#level_up" do
			it "takes in an optional class" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

				new_character.level_up()
				new_character.level_up(_class: multi_class)
			end

			it "levels up the existing class" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)
				
				new_character.level_up()

				expect(new_character.level).to eq(2)
			end

			it "adds a new class to the list" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

				new_character.level_up(_class: multi_class)
				
				expect(new_character.classes).to include(multi_class)
			end

			it "levels up existing class if a class name is passed" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

				new_character.level_up(_class: multi_class)
				new_character.level_up(_class: "other class")
				
				expect(new_character.classes[0].level).to eq(1)
				expect(new_character.classes[1].level).to eq(2)
			end

			it "levels up base class if passed class name is not valid" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

				new_character.level_up(_class: multi_class)
				new_character.level_up(_class: "fail")
				
				expect(new_character.classes[0].level).to eq(2)
				expect(new_character.classes[1].level).to eq(1)
			end

			it "increases health on level up" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class, 5)

				new_character.level_up(_class: nil, _additional_hp: 5)
				
				expect(new_character.hit_points).to eq(10)
			end
		end
	end
end