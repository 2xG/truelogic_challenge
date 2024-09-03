# frozen_string_literal: true

DATA_FILE = 'soccer.dat'
TEAM_LINE_REGEX = /^\s+\d+\.\s(?<team>\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(?<gf>\d+)\s+-\s+(?<ga>\d+)/

file = open(DATA_FILE)

min_diff = nil
min_diff_team = nil

file.each do |line|
  data = line.match(TEAM_LINE_REGEX)
  next if data.nil?

  gf = data[:gf].to_i
  ga = data[:ga].to_i

  diff = (gf - ga).abs

  if min_diff.nil? || diff < min_diff
    min_diff = diff
    min_diff_team = data[:team]
  end
end

puts min_diff_team
