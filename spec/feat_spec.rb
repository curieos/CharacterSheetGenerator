RSpec.describe "Feat" do
	let(:dummy_feat) { CharacterSheetGenerator::Feat.new("Athlete") }

	it "exists" do
		expect(dummy_feat).to_not be_nil
	end
end