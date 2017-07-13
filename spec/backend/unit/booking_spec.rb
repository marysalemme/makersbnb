describe Booking do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :start_date }
  it { is_expected.to have_property :end_date }
  it { is_expected.to belong_to :space }
end
