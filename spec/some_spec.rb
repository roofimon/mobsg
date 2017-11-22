def roman_numeral input
    intArr = input.split("+")

    result = ""
    intArr.each do |element|
        result += convert_to_i(element)
    end
    
    convert_to_roman result
end

def convert_to_i roman
    # Order the subs by length of the roman characters (asc),
    # then order by length of i (asc)
    roman.gsub! "IV",    "IIII"
    roman.gsub! "IX",    "IIIIIIIII"
    roman.gsub! "XL",    "XXXX"
    roman.gsub! "V",     "IIIII"
    roman.gsub! "X",     "IIIIIIIIII"
    roman
end

def convert_to_roman i
    # Order i by value (des)
    i.gsub! "IIIIIIIIII",    "X"
    i.gsub! "XXXXX",         "L"    
    i.gsub! "XXXX",          "XL"
    i.gsub! "IIIIIIIII",     "IX"
    i.gsub! "IIIII",         "V"
    i.gsub! "IIII",          "IV"
    i
end


describe "RomanNumerals" do 
    [
        %w("I+I" "II"),
        %w("I+II" "III"),
        %w("I+III" "IV"),
        %w("II+III" "V"),
        %w("I+IV" "V"),
        %w("IV+I" "V"),
        %w("IV+IV" "VIII"),
        %w("IV+III" "VII"),
        %w("IV+V" "IX"),
        %w("VI+VII" "XIII"),
        %w("IX+IX" "XVIII"),
        %w("XV+XIV" "XXIX"),
        %w("XXII+XIX" "XLI"),
        %w("XLIV+XXIII" "LXVII"),
    ].each do |input, output|
        context "Count Romans" do
            it "#{input} should return #{output}" do 
                expect(roman_numeral(input)).to eq output
            end
        end
    end

    [
        %w("IV" "IIII"),
        %w("VI" "IIIIII"),
        %w("V" "IIIII"),
        %w("IX" "IIIIIIIII"),
        %w("X" "IIIIIIIIII"),
        %w("XL" "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"),
    ].each do |roman, i|
        context "convert_to_i all to I" do
            it "#{roman} should return #{i}" do
                expect(convert_to_i(roman)).to eq i 
            end
        end
    end
end