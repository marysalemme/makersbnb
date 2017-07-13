describe Booking do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :start_date }
  it { is_expected.to have_property :end_date }
  it { is_expected.to have_property :approval }
  it { is_expected.to belong_to :space }

  it "will have a default approval of false" do
    booking = Booking.create(start_date: Date.parse("10/7/2017"), end_date:  Date.parse("11/7/2017"))
    expect(booking.approval).to be false
  end
end
