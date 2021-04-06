
require 'oystercard'
describe Oystercard do

    it 'has a balance' do
        expect(subject.balance).to eq(0)   
    end

    it 'can be top up' do
        expect(subject.top_up(10)).to eq(10)
    end
    it 'over 90 raises an error' do
        max_value = Oystercard::MAXVALUE
        subject.top_up(max_value)
        expect{subject.top_up 1}.to raise_error 'Max value of #{max_value} exceeded'
    end

    it 'deducts the fare' do
        subject.top_up(20)
        expect(subject.deduct(2)).to eq(18)
    end
end