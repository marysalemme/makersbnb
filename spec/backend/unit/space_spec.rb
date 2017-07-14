describe Space do
  let(:subject) { Space.new(description: "test", price: "10", location: "testville")}

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :description }
  it { is_expected.to have_property :price }
  it { is_expected.to have_property :location }
  it { is_expected.to belong_to :user }

  describe '#occupied?' do
    it { is_expected.to respond_to :occupied? }
  end

  describe '#available_on' do
    it { is_expected.to respond_to :available_on }
  end
end
