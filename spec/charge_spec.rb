require 'charge'

  describe Charge do
    subject(:charge) { Charge.new }

    let(:a_station){ double(:station, name: 'Angel')}
    let(:b_station){ double(:station, name: 'Barbican')}
    let(:a_journey){ double(:journey, start_station: a_station, end_station: a_station) }
    let(:b_journey){ double(:journey, start_station: b_station, end_station: b_station) }

    it 'calculates price for zone A journey' do
      charge.journey_price(a_journey)
      expect(charge.total_price).to eq(250)
    end

    it 'calculates price for zone B journey' do
      charge.journey_price(b_journey)
      expect(charge.total_price).to eq(300)
    end

    xit 'caps zone A journeys' do
      charge.journey_price(a_journey)
      charge.journey_price(a_journey)
      charge.journey_price(a_journey)
      expect(charge.total_price).to eq(700)
    end


end
