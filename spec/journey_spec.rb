require 'journey'
require 'station'
describe Journey do
     context ' doesnt have a station' do
    it 'has a penalty fare by default' do
        
        expect(subject.fare).to eq Journey::PENALTY_FARE
        
         end
        end

    context 'has a station' do
    subject(:journey) {described_class.new(entry_station: :station)}
    
    let(:other_station) {double :other_station }
    
    
    it ' starts with a entry station' do
        expect(journey.entry_station).to eq :station
    end

    it 'knows if is not completed' do
        expect(journey).not_to be_complete
    end

    it 'finishes journey' do 
        journey.exit_station(other_station)
        expect(journey).to be_complete    
    end

    it 'returns itself when finish journey' do
        expect(journey.exit_station(other_station)).to eq journey
    end

    

    it 'calculates a fare' do
        journey.exit_station(other_station)
        expect(journey.fare).to eq 1
    end
     
end      
   
end