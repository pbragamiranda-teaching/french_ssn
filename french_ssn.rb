require 'date'
require 'yaml'

# 1. Create regex structure
SSN_PATTERN = /^(?<gender>[12]) ?(?<year>\d{2}) ?(?<month>0[0-9]|1[0-2]) ?(?<dept>\d{2}) ?(\d{3}) ?(\d{3}) ?(?<key>\d{2})/
# 2. Create the method (1 param)

def french_ssn_info(ssn)
  # 3. Check if regex is valid
  match_data = ssn.match(SSN_PATTERN)

  if match_data && valid_key?(ssn, match_data[:key])
    gender = find_gender(match_data[:gender])
    # 6. Extract year
    year   = "19#{match_data[:year]}"
    month  = find_month(match_data[:month])
    dept   = find_dept(match_data[:dept])
    # "a man, born in December, 1984 in Seine-Maritime."
    # 9. return the proper phrase
    return "a #{gender}, born in #{month}, #{year} in #{dept}."
  else
    return "The number is invalid"
  end
end


# 4. Check if 2 digits criteria pass
def valid_key?(ssn, key)
  (97 - ssn.delete(' ')[0..12].to_i) % 97 == key.to_i
end

# 5. Extract gender
def find_gender(code)
  return code == "1" ? "man" : "woman"
end

# 7. Extract month
def find_month(code)
  return Date::MONTHNAMES[code.to_i]
end

# 8. Extract department
def find_dept(code)
  YAML.load_file('data/french_departments.yml')[code]
end
