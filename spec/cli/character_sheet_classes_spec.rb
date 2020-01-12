RSpec.describe "Classes" do
	let(:classes) { CharacterSheetGenerator::Classes.new() }

	it 'exists' do
		expect(classes).to_not be_nil
	end
end