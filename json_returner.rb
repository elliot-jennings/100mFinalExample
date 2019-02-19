require 'json'

# Load the raw json data and parse it into readable format for ruby.
raw_data = JSON.parse(File.read('100mFinal.json'))

# Description of what is returned for user.
p "100m Final Results - British Championships 2018"

# My array of times to calculate the average from.
final_times_array = []

# Iteration method for each object within the data.
raw_data.each do |result|
  # Place each result (formatted into a float) into my times array.
  final_times_array << result['c_Result'].to_f
  # Puts the formatted string using interpolation.
  p "#{result['c_Rank'].to_i}. #{result['c_Participant']} - #{result['c_Result']}s"
end

# Calculate the average time after my iteration method. Utilising reduce regular expression to sum all the times.
average_time = final_times_array.reduce(:+).to_f / final_times_array.size

# Puts the calculated average, and rounds down to 2 decimal places.
p "Average Time: #{average_time.round(2)}s"