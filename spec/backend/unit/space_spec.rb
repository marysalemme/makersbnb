describe Space do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :description }
  it { is_expected.to have_property :price }
  it { is_expected.to have_property :location }
  it { is_expected.to belong_to :user }
end
