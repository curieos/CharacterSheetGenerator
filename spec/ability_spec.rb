RSpec.describe "Ability" do
	let(:dummy_ability) { CharacterSheetGenerator::Ability.new("Strength", 13, 2) }

	it "exists" do
		expect(dummy_ability).to_not be_nil
	end

	it "has a name" do
		expect(dummy_ability.name).to eq("Strength")
	end
end