
require 'oystercard'
describe Oystercard do
    subject(:card) { described_class.new }

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

    it 'deducts the fare' do
        card.top_up(20)
        expect(card.deduct(2)).to eq(18)
    end
describe' card travel' do 
    it 'is not in journey when new' do
        expect(card).not_to be_in_journey
    end

    it ' starts a journey' do
        card.top_up(10)
        card.touch_in
        expect(card).to be_in_journey
    end
    it 'ends a journey' do
        #subject.touch_in
        card.touch_out
        expect(card).not_to be_in_journey
    end
    it 'touch in<1 to raise error' do
        min_value = Oystercard::MINVALUE 
        card.balance < min_value
        expect{card.touch_in}.to raise_error 'insuf. founds'
    end

    it 'charges when touch out' do
        expect{card.touch_out}.to change{card.balance}.by(-Oystercard::MINVALUE)
    end
end

end