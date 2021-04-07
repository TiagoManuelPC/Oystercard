
require 'oystercard'
describe Oystercard do
    subject(:card) { described_class.new }
    #let(:station) { double (:station)}
    let(:entry_station) {double :station}
    let(:exit_station) {double :station}
    let(:journey){{entry_station: entry_station, exit_station: exit_station}} 
    it 'has a balance' do
        expect(card.balance).to eq(0)   
    end

    it 'can be top up' do
        expect(card.top_up(10)).to eq(10)
    end
    it 'over 90 raises an error' do
        max_value = Oystercard::MAXVALUE
        card.top_up(max_value)
        expect{card.top_up 1}.to raise_error 'Max value of #{max_value} exceeded'
    end

    #xit 'deducts the fare' do
     #   card.top_up(20)
      #  expect(card.deduct(2)).to eq(18)
    #end
describe' card travel' do 
    it 'is not in journey when new' do
        expect(card).not_to be_in_journey
    end

    it ' starts a journey' do
        card.top_up(10)
        card.touch_in(entry_station)
        expect(card).to be_in_journey
    end
    it 'ends a journey' do
        #subject.touch_in
        card.touch_out(exit_station)
        expect(card).not_to be_in_journey
    end
    it 'touch in<1 to raise error' do
        min_value = Oystercard::MINVALUE 
        card.balance < min_value
        expect{card.touch_in(entry_station)}.to raise_error 'insuf. founds'
    end

    it 'charges when touch out' do
        expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::MINVALUE)
    end
    it 'remebers the station' do
        card.top_up(10)
        expect(card.touch_in(entry_station)).to eq(entry_station)
    end
    it 'deletes the station' do
       card.top_up(10)
        card.touch_in(entry_station)
       card.touch_out(exit_station)
        expect(card.entry_station).to eq nil
    end

    it 'when initializes is empty' do
        expect(card.journeys).to be_empty
    end

    it 'stores a jorney' do
        card.top_up(10)
        card.touch_in(entry_station)
       card.touch_out(exit_station)
        expect(card.journeys).not_to be_empty
    end
end
it 'stores a jorney' do
    card.top_up(10)
    card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(card.journeys).to include journey
end


end