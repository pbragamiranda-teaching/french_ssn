require_relative "../french_ssn"

describe "french ssn" do
  it "returns invalid when not valid " do
    actual = french_ssn_info("")
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "proper phrase with info" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end

end
