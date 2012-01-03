Given /^I have no banners$/ do
  Banner.delete_all
end

Given /^I (only )?have banners titled "?([^\"]*)"?$/ do |only, titles|
  Banner.delete_all if only
  titles.split(', ').each do |title|
    Banner.create(:name => title)
  end
end

Then /^I should have ([0-9]+) banners?$/ do |count|
  Banner.count.should == count.to_i
end
