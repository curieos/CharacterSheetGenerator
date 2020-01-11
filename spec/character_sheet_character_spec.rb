RSpec.describe "Character" do
	let(:dummy_class) { CharacterSheetGenerator::Class.new("Dummy Class", 10) }
	let(:dummy_character) { CharacterSheetGenerator::Character.new("Dummy Name", dummy_class) }

	it "exists" do
		expect(dummy_character).to_not be_nil
	end

	it "has a name" do
		dummy_name = "Tim"
		new_character = CharacterSheetGenerator::Character.new(dummy_name, dummy_class)

		expect(new_character.name).to eq(dummy_name)
	end

	describe '#class' do
		it "exists" do
			new_class = CharacterSheetGenerator::Class.new("new class", 10)
			new_character = CharacterSheetGenerator::Character.new("new character", new_class)

			expect(new_character.classes).to include(new_class)
		end
	end

	describe "level methods" do
		it "has a #level method that totals class levels" do
			new_class = CharacterSheetGenerator::Class.new("new class", 10)
			new_character = CharacterSheetGenerator::Character.new("new character", new_class)

			expect(new_character.level).to eq(1)
		end

		describe "#level_up" do
			it "takes in an optional class" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class)

				new_character.level_up()
				new_character.level_up(multi_class)
			end

			it "levels up the existing class" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class)
				
				new_character.level_up()

				expect(new_character.level).to eq(2)
			end

			it "adds a new class to the list" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class)

				new_character.level_up(multi_class)
				
				expect(new_character.classes).to include(multi_class)
			end

			it "levels up existing class if a class name is passed" do
				new_class = CharacterSheetGenerator::Class.new("new class", 10)
				multi_class = CharacterSheetGenerator::Class.new("other class", 8)
				new_character = CharacterSheetGenerator::Character.new("new character", new_class)

				new_character.level_up(multi_class)
				new_character.level_up("other class")
				
				expect(new_character.classes[0].level).to eq(1)
				expect(new_character.classes[1].level).to eq(2)
			end
		end
	end
end