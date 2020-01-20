RSpec.describe "Equipment" do
	let(:dummy_equipment) { CharacterSheetGenerator::Equipment.new("Club") }

	it "exists" do
		expect(dummy_equipment).to_not be_nil
	end

	it "has a name" do
		expect(dummy_equipment.name).to eq("Club")
	end
end