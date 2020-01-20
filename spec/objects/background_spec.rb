RSpec.describe "Background" do
	let(:dummy_background) { CharacterSheetGenerator::Background.new("Articifer") }

	it "exists" do
		expect(dummy_background).to_not be_nil
	end

	it "has a name" do
		expect(dummy_background.name).to eq("Articifer")
	end
end