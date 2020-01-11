RSpec.describe "Character" do
	let(:character) { CharacterSheetGenerator::Character.new("Dummy Name") }

	it "exists" do
		expect(character).to_not be_nil
	end

	it "has a name" do
		dummy_name = "Tim"
		new_character = CharacterSheetGenerator::Character.new(dummy_name)

		expect(new_character.name).to eq(dummy_name)
	end

	describe '#class' do
		it "exists" do
			new_class = CharacterSheetGenerator::Class.new("new class")
			new_character = CharacterSheetGenerator::Character.new("new character", new_class)

			expect(new_character.classes).to include(new_class)
		end
	end
end