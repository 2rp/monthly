require 'spec_helper'
require 'date'

module Monthly
  describe Calculator do

    subject { Calculator.new(from, to) }

    describe "#partial_months" do
      let(:result) { subject.partial_months }

      context "1 month (1.1.2015–31.1.2015)" do
        let(:from) { Date.parse('1.1.2015') }
        let(:to) { Date.parse('31.1.2015') }
        it "returns 1" do
          expect(result).to eq(1)
        end
      end

      context "1/2 month (1.1.2015–15.1.2015)" do
        let(:from) { Date.parse('1.1.2015') }
        let(:to) { Date.parse('15.1.2015') }

        it "returns 0.5 (1 - 15/30)" do
          expect(result).to eq(0.5)
        end
      end

      context "1 month and days (1.1.2015–1.2.2015)" do
        let(:from) { Date.parse('1.1.2015') }
        let(:to) { Date.parse('1.2.2015') }

        it "returns 1.03 (1 + (1 - 29/30))" do
          expect(result).to eq(1 + (1 - 29/30.0))
        end
      end

      context "1 month and offset days (15.1.2015–14.2.2015)" do
        let(:from) { Date.parse('15.1.2015') }
        let(:to) { Date.parse('14.2.2015') }

        it "returns 1 ((1 - 14/30) + (1 - 16/30))" do
          expect(result).to be_within(0.001).of(1)
        end
      end

      context "1 day in 31 day month (31.1.2015–31.1.2015)" do
        let(:from) { Date.parse('31.1.2015') }
        let(:to) { Date.parse('31.1.2015') }

        it "returns 0 (1 - 30/30)" do
          expect(result).to eq(0)
        end
      end

      context "1 day in 28 day month (28.2.2015–28.2.2015)" do
        let(:from) { Date.parse('28.2.2015') }
        let(:to) { Date.parse('28.2.2015') }

        it "returns 0.1 (1 - 27/30)" do
          expect(result).to eq(1 - 27/30.0)
        end
      end

      context "1 day in beginning of month (1.1.2015–1.1.2015)" do
        let(:from) { Date.parse('1.1.2015') }
        let(:to) { Date.parse('1.1.2015') }

        it "returns 0.03 (1 - 29/30)" do
          expect(result).to eq((1 - 29/30.0))
        end
      end

      context "1 day in end of month and year (31.12.2015–31.12.2015)" do
        let(:from) { Date.new(2015, 12, 31) }
        let(:to) { Date.new(2015, 12, 31) }

        it "returns 0 (1 - 30/30)" do
          expect(result).to eq(0)
        end
      end

      context "1 year, 1 month, 1, day (1.1.2015–1.2.2016)" do
        let(:from) { Date.parse('1.1.2015') }
        let(:to) { Date.parse('1.2.2016') }

        it "returns 13,03 (12 + 1 + (1 - 29/30))" do
          expect(result).to eq(12 + 1 + (1 - 29/30.0))
        end
      end
    end
  end
end
