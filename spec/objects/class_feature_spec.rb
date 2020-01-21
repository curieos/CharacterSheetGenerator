RSpec.describe 'ClassFeature' do
	let(:dummy_class_feature) { CharacterSheetGenerator::ClassFeature.new("Bardic Inspiration", "") }

	it "has source that is 'Class'" do
		expect(dummy_class_feature.source).to eq("Class")
	end
end