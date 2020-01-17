RSpec.describe "Character" do
	let(:dummy_abilites) { [CharacterSheetGenerator::Ability.new("STR", 15, 2, {Athletics: 1}),
		CharacterSheetGenerator::Ability.new("DEX", 13, 0, {Acrobatics: 0})] }
	let(:dummy_class) { CharacterSheetGenerator::Class.new("Dummy Class", 10) }
	let(:dummy_character) { CharacterSheetGenerator::Character.new("Dummy Name", dummy_class, dummy_abilites,  5, "Lawful Good", "Hermit") }

	it "exists" do
		expect(dummy_character).to_not be_nil
	end

	it "has a name" do
		expect(dummy_character.name).to eq("Dummy Name")
	end

	it "has a proficiency bonus" do
		expect(dummy_character.proficiency_bonus).to eq(2)
	end

	it "#proficiency_bonus is not hard-coded and calculated correctly" do
		dummy_character.level_up()

		expect(dummy_character.proficiency_bonus).to eq(2)

		dummy_character.level_up()

		expect(dummy_character.proficiency_bonus).to eq(2)
		
		dummy_character.level_up()

		expect(dummy_character.proficiency_bonus).to eq(2)
		
		dummy_character.level_up()

		expect(dummy_character.proficiency_bonus).to eq(3)
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

	it "has a background" do
		expect(dummy_character.background).to_not be_nil
	end

	it "has an alignment" do
		expect(dummy_character.alignment).to_not be_nil
	end

	it "has personality traits" do
		expect(dummy_character.personality_traits).to_not be_nil
	end

	it "has ideals" do
		expect(dummy_character.ideals).to_not be_nil
	end

	it "has bonds" do
		expect(dummy_character.bonds).to_not be_nil
	end

	it "has flaws" do
		expect(dummy_character.flaws).to_not be_nil
	end

	describe "#classes" do
		it "has a class" do
			expect(dummy_character.classes).to include(dummy_class)
		end
	end

	describe "#abilities" do
		it "has abilities" do
			expect(dummy_character.abilities.length).to_not be_nil
		end
	end

	describe "#hit_points" do
		it "has a starting hp" do
			expect(dummy_character.hit_points).to eq(5)
		end

		it "has a #current_hp method" do
			expect(dummy_character.current_hp).to eq (5)
		end

		it "can take damage" do
			dummy_character.take_damage(3)

			expect(dummy_character.current_hp).to eq(2)
		end

		it "can't drop lower than 0 hp" do
			dummy_character.take_damage(8)

			expect(dummy_character.current_hp).to eq(0)
		end

		it "returns hp after damage" do
			expect(dummy_character.take_damage(8)).to eq(-3)
		end

		it "can gain hp" do
			dummy_character.take_damage(3)
			dummy_character.heal(2)

			expect(dummy_character.current_hp).to eq(4)
		end

		it "can't gain more than the max hp" do
			dummy_character.heal(3)

			expect(dummy_character.current_hp).to eq(5)
		end

		it "has #temp_hp" do
			expect(dummy_character.temp_hp).to_not be_nil
		end

		it "can gain temporary hp" do
			dummy_character.gain_temp_hp(5)

			expect(dummy_character.current_hp).to eq(10)
		end

		it "looses temporary hp before real hp" do
			dummy_character.gain_temp_hp(5)
			dummy_character.take_damage(3)

			expect(dummy_character.current_hp).to eq(7)
			expect(dummy_character.temp_hp).to eq(2)

			dummy_character.take_damage(3)

			expect(dummy_character.temp_hp).to eq(0)
			expect(dummy_character.current_hp).to eq(4)
		end
	end

	describe "level methods" do
		it "has a #level method that totals class levels" do
			expect(dummy_character.level).to eq(1)
		end

		describe "#level_up" do
			it "takes in an optional class" do
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)

				dummy_character.level_up()
				dummy_character.level_up(_class: multi_class)
			end

			it "levels up the existing class" do
				dummy_character.level_up()

				expect(dummy_character.level).to eq(2)
			end

			it "adds a new class to the list" do
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)

				dummy_character.level_up(_class: multi_class)
				
				expect(dummy_character.classes).to include(multi_class)
			end

			it "levels up existing class if a class name is passed" do
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)

				dummy_character.level_up(_class: multi_class)
				dummy_character.level_up(_class: "other class")
				
				expect(dummy_character.classes[0].level).to eq(1)
				expect(dummy_character.classes[1].level).to eq(2)
			end

			it "levels up base class if passed class name is not valid" do
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)

				dummy_character.level_up(_class: multi_class)
				dummy_character.level_up(_class: "fail")
				
				expect(dummy_character.classes[0].level).to eq(2)
				expect(dummy_character.classes[1].level).to eq(1)
			end

			it "increases health on level up" do
				dummy_character.level_up(_class: nil, _additional_hp: 5)
				
				expect(dummy_character.hit_points).to eq(10)
			end
		end
	end
end