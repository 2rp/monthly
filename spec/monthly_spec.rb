require 'spec_helper'
require 'date'

describe Monthly do
  it 'has a version number' do
    expect(Monthly::VERSION).not_to be nil
  end

   describe ".partial_months(from, to, days_per_month=30)" do
     subject { Monthly.partial_months(from, to) }
     context "from: 1.1–31.1" do
       let(:from) { Date.new(2015, 1, 1) }
       let(:to) { Date.new(2015, 1, 31) }
       it "returns 1" do
         expect(subject).to eq(1)
       end
     end
   end

   describe ".periods_by_month(from, to)" do
     subject { Monthly.periods_by_month(from, to) }
     context "from: 9.1.2015–18.4.2015" do
       let(:from) { Date.new(2015, 1, 9) }
       let(:to) { Date.new(2015, 4, 18) }
       it "returns 4 periods" do
          expected = [
            {from: from, to: Date.new(2015, 1, 31)},
            {from: Date.new(2015, 2, 1), to: Date.new(2015, 2, 28)},
            {from: Date.new(2015, 3, 1), to: Date.new(2015, 3, 31)},
            {from: Date.new(2015, 4, 1), to: Date.new(2015, 4, 18)},
          ]
         expect(subject).to eq(expected)
       end
     end
   end
end
