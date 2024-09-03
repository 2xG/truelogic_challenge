# frozen_string_literal: true

DATA_FILE = 'w_data.dat'
DAY_TEMP_REGEX = /^\s+(?<day>\d+)\s+(?<t_max>\d+)\*?\s+(?<t_min>\d+)/

file = open(DATA_FILE)

min_diff = nil
min_diff_day = nil

file.each do |line|
  data = line.match(DAY_TEMP_REGEX)
  next if data.nil?

  t_max = data[:t_max].to_i
  t_min = data[:t_min].to_i

  diff = t_max - t_min

  if min_diff.nil? || diff < min_diff
    min_diff = diff
    min_diff_day = data[:day]
  end
end

puts min_diff_day
