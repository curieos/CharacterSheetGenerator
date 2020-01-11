RSpec.describe "Character" do
	let(:character) { CharacterSheetGenerator::Character.new() }

	it "exists" do
		expect(character).to_not be_nil
	end
end