RSpec.describe "Class" do
	let(:new_class) { CharacterSheetGenerator::Class.new("Dummy Name") }

	it "exists" do
		expect(new_class).to_not be_nil
	end
end