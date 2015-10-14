require 'journey'

describe Journey do
  subject(:journey) {Journey.new}


  let(:station){double(:station, name: 'Angel')}

  describe '#touch_in' do

    it 'sets a start station' do
      journey.touch_in(station)
      expect(journey.start_station).to eq(station)
    end
  end

  describe '#touch_out' do

    it 'sets a end station' do
      journey.touch_out(station)
      expect(journey.end_station).to eq(station)
    end
  end
end
