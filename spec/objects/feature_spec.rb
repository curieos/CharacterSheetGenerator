RSpec.describe "Feature" do
	let(:dummy_feat) { CharacterSheetGenerator::Feature.new("Athlete") }

	it "exists" do
		expect(dummy_feat).to_not be_nil
	end

	it "has a name" do
		expect(dummy_feat.name).to eq("Athlete")
	end
end