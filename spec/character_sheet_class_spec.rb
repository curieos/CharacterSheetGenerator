RSpec.describe "Class" do
	let(:dummy_class) { CharacterSheetGenerator::Class.new("Dummy Name") }

	it "exists" do
		expect(dummy_class).to_not be_nil
	end

	it "has a name" do
		expect(dummy_class.name).to eq("Dummy Name")
	end
end