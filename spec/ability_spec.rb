RSpec.describe "Ability" do
	let(:dummy_ability) { CharacterSheetGenerator::Ability.new() }

	it "exists" do
		expect(dummy_ability).to_not be_nil
	end
end