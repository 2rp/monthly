require "monthly/version"
require "monthly/calculator"

module Monthly
  def self.partial_months(from, to, days_per_month=30)
    calculator = Calculator.new(from, to, days_per_month)
    calculator.partial_months
  end
end
