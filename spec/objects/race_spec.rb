RSpec.describe "Race" do
	let(:dummy_race) { CharacterSheetGenerator::Race.new("Elf", 30, [CharacterSheetGenerator::RaceFeature::new("Dark Vision", "")], _subrace: "High Elf") }

	it "exists" do
		expect(dummy_race).to_not be_nil
	end

	it "has a name" do
		expect(dummy_race.name).to eq("Elf")
	end

	it "has a speed" do
		expect(dummy_race.speed).to eq(30)
	end

	it "has an optional subrace" do
		expect(dummy_race.subrace).to eq("High Elf")
	end

	it "has race features" do
		expect(dummy_race.features).to_not be_nil
	end
end