class WelcomeController < ApplicationController

  def index
    count_weekdays_in_range
    query = <<-SQL
      SELECT (array_agg(c1.name))[1] as city_start_name,
             (array_agg(c2.name))[1] as city_end_name,
             city_start_id,
             city_end_id,
             array_agg(week_and_day) weeks_and_days
      FROM
        (SELECT ARRAY[EXTRACT(WEEK FROM date_start), EXTRACT(DOW FROM date_start)] week_and_day,
                city_start_id,
                city_end_id
         FROM routes
         GROUP BY city_start_id,
                  city_end_id,
                  ARRAY[EXTRACT(WEEK FROM date_start), EXTRACT(DOW FROM date_start)]
        ) AS _
      JOIN cities c1 ON c1.id = city_start_id
      JOIN cities c2 ON c2.id = city_end_id
      GROUP BY city_start_id,
               city_end_id
    SQL
    @result = Route.find_by_sql(query)
    @result.each do |row|
      row.weeks_days = {}
      grouped_by_week_days = row.weeks_and_days.group_by(&:last)
      grouped_by_week_days.each do |week_day, weeks_and_days|
        row.weeks_days[week_day] = @weekdays_in_range[week_day.to_i] == weeks_and_days.length
      end
    end
  end

  private

  # Подсчитывает полное количество понедельников, вторников и т.д. в интервале дат.
  # Вероятно проблемными являются граничные даты если у них не полный день, но это 
  # уже выходит за пределы тестового задания
  def count_weekdays_in_range
    @weekdays_in_range = Hash.new(0)
    min_max_dates = Route.find_by_sql("SELECT min(date_start) AS min_date, 
                                      max(date_start) AS max_date FROM routes").first
    @range = (min_max_dates.min_date.to_date..min_max_dates.max_date.to_date)
    @range.each do |date|
      @weekdays_in_range[date.wday] += 1
    end
  end

end
