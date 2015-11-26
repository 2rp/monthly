require 'spec_helper'
require 'date'

describe Monthly do
  it 'has a version number' do
    expect(Monthly::VERSION).not_to be nil
  end

   describe ".partial_months(from, to, days_per_month=30)" do
     subject { Monthly.partial_months(from, to) }
     context "from: 1.1–31.1" do
       let(:from) { Date.parse('1.1.2015') }
       let(:to) { Date.parse('31.1.2015') }
       it "returns 1" do
         expect(subject).to eq(1)
       end
     end
   end
end
