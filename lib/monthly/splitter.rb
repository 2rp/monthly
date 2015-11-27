module Monthly
  class Splitter
    attr_reader :from, :to

    def initialize(from, to)
      @from, @to = from, to
      @current_from = self.from
      @current_to = last_day_of_month(self.from)
    end

    def execute
      [].tap do |out|
        out << {from: self.from, to: self.to} if out_of_range?(@current_to)
        while in_range?(@current_to)
          out << {from: @current_from, to: @current_to}
          out << {from: next_from, to: self.to} if last_month_is_partial?
          set_next_from_and_to
        end
      end
    end

  private

    def in_range?(date)
      date <= self.to
    end

    def out_of_range?(date)
      !in_range?(date)
    end

    def last_month_is_partial?
      out_of_range?(next_to) && self.to > @current_to
    end

    def set_next_from_and_to
      set_next_from
      set_next_to
    end

    def set_next_from
      @current_from = next_from
    end

    def set_next_to
      @current_to = next_to
    end

    def next_from
      first_day_of_month(@current_from.next_month)
    end

    def next_to
      last_day_of_month(@current_to.next_month)
    end

    def first_day_of_month(date)
      Date.new(date.year, date.month, 1)
    end

    def last_day_of_month(date)
      Date.new(date.year, date.month + 1, 1).prev_day
    end

  end
end
