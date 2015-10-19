require 'clamcard'

  describe ClamCard do
    subject(:clamcard) { ClamCard.new }

    let(:a_station){ double(:station, name: 'Angel')}
    let(:b_station){ double(:station, name: 'Barbican')}
    let(:a_journey){ double(:journey, start_station: a_station, end_station: a_station) }
    let(:b_journey){ double(:journey, start_station: b_station, end_station: b_station) }

    it 'calculates price for zone A journey' do
      clamcard.journey_price(a_journey)
      expect(clamcard.total_price).to eq(250)
    end

    it 'calculates price for zone B journey' do
      clamcard.journey_price(b_journey)
      expect(clamcard.total_price).to eq(300)
    end

    it 'caps zone A journeys' do
      clamcard.journey_price(a_journey)
      clamcard.journey_price(a_journey)
      clamcard.journey_price(a_journey)
      expect(clamcard.total_price).to eq(700)
    end

    it 'caps zone B journeys' do
      clamcard.journey_price(b_journey)
      clamcard.journey_price(b_journey)
      clamcard.journey_price(a_journey)
      expect(clamcard.total_price).to eq(800)
    end


end
