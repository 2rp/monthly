require "monthly/version"
require "monthly/calculator"
require "monthly/splitter"

module Monthly
  def self.partial_months(from, to, days_per_month=30)
    calculator = Calculator.new(from, to, days_per_month)
    calculator.partial_months
  end

  def self.periods_by_month(from, to)
    Splitter.new(from, to).execute
  end
end
