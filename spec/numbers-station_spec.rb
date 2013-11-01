require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "NumbersStation" do
	it "encodes and decodes strings" do
		e = NumbersStation.new
		e.decode(e.encode('my name is doug. i am 6900 years old')).should match("MYNAMEISDOUG.IAM6900YEARSOLD")
	end
end
