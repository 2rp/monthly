require 'spec_helper'
require 'date'

module Monthly
  describe Splitter do

    subject { Splitter.new(from, to) }

    describe "#execute" do
      let(:result) { subject.execute }

      context "1 day (15.1.2015–15.1.2015)" do
        let(:from) { Date.new(2015, 1, 15) }
        let(:to) { Date.new(2015, 1, 15) }

        it "returns period" do
          expect(result).to eq([{from: from, to: to}])
        end
      end

      context "1/2 month (1.1.2015–15.1.2015)" do
        let(:from) { Date.new(2015, 1, 1) }
        let(:to) { Date.new(2015, 1, 15) }

        it "returns period" do
          expect(result).to eq([{from: from, to: to}])
        end
      end

      context "1 month (1.1.2015–31.1.2015)" do
        let(:from) { Date.new(2015, 1, 1) }
        let(:to) { Date.new(2015, 1, 31) }

        it "returns period" do
          expect(result).to eq([{from: from, to: to}])
        end
      end

      context "2 months (1.1.2015–28.2.2015)" do
        let(:from) { Date.new(2015, 1, 1) }
        let(:to) { Date.new(2015, 2, 28) }

        it "returns 2 periods (1.1.2015–31.1.2015 and 1.2.2015–28.2.2015)" do
          expected = [
            {from: from, to: Date.new(2015, 1, 31)},
            {from: Date.new(2015, 2, 1), to: Date.new(2015, 2, 28)}
          ]
          expect(result).to eq(expected)
        end
      end

      context "2 months with days offset (15.1.2015–15.2.2015)" do
        let(:from) { Date.new(2015, 1, 15) }
        let(:to) { Date.new(2015, 2, 15) }

        it "returns 2 periods (15.1.2015–31.1.2015 and 1.2.2015–15.2.2015)" do
          expected = [
            {from: from, to: Date.new(2015, 1, 31)},
            {from: Date.new(2015, 2, 1), to: Date.new(2015, 2, 15)}
          ]
          expect(result).to eq(expected)
        end
      end

    end
  end
end
