RSpec.describe "Race" do
	let(:dummy_race) { CharacterSheetGenerator::Race.new("Elf") }

	it "exists" do
		expect(dummy_race).to_not be_nil
	end

	it "has a name" do
		expect(dummy_race.name).to eq("Elf")
	end
end