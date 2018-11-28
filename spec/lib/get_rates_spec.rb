require 'rails_helper'

describe GetRatesJob do

  let(:job) { described_class.new }
  
  describe '#perform' do
    subject { job.perform }

    it 'should create original rate' do
      expect { subject }.to change(Rates::Original, :count).by(1)
    end

    it 'have to call ActualRate`s instance method' do
      expect_any_instance_of(ActualRate).to receive(:broadcast)
      subject
    end
  end

  describe '#usd_value' do
    subject { job.send(:usd_value) }
    let(:usd_mock) { 99 }
    let(:json_value) do
      {
        'Valute' => {
          'USD' => {
            'Value' => usd_mock
          }
        }
      }
    end

    before do
      allow(job).to receive(:json).and_return(json_value)
    end

    it 'should extract USD value' do
      expect(subject).to eql usd_mock
    end
  end
end