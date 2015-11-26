module Monthly
  class Calculator
    attr_reader :from, :to, :days_per_month

    def initialize(from, to, days_per_month=30)
      @from, @to, @days_per_month = from, to, days_per_month
    end

    def partial_months
      months_between - partial_months_in_beginning - partial_months_in_end
    end

  private

    def partial_months_in_beginning
      return 0 if self.from.day == 1
      days_in_beginning / self.days_per_month.to_f
    end

    def partial_months_in_end
      return 0 if self.to.day == last_day_of_month(self.to)
      days_in_end / self.days_per_month.to_f
    end

    def days_in_beginning
      self.from.day - 1
    end

    def days_in_end
      self.days_per_month - self.to.day
    end

    def months_between
      1 + (self.to.year * 12 + self.to.month) - (self.from.year * 12 + self.from.month)
    end

    def last_day_of_month(date)
      Date.new(date.year, date.month + 1, 1).prev_day.day
    end

  end
end
