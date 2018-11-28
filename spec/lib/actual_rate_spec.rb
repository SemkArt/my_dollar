require 'rails_helper'

describe ActualRate do

  let(:service) { described_class.new }
  after { subject }

  describe '#broadcast' do
    subject { service.broadcast }

    it 'have to call ActionCable`s methods chain' do
      expect(ActionCable).to receive_message_chain(:server, :broadcast)
    end
  end

  describe '#last' do
    subject { service.last }
    let!(:original_rate) { create(:original_rate) }
    
    context 'when there are no actual forced rates' do
      let!(:forced_rate) { create(:forced_rate, forced_to: 2.days.ago) }

      it 'should return original rate' do
        expect(subject).to eql original_rate
      end
    end
    
    context 'when there is actual forced rate' do
      let!(:forced_rate) { create(:forced_rate) }

      it 'should return forced rate' do
        expect(subject).to eql forced_rate
      end
    end
  end
end