When /^I select ([A-Z][1-9][0-9]*)$/ do |cell|
  find(".#{cell}").click()
end

When /^I enter "([^"]*)" into the expression editor$/ do |expression|
  fill_in "Expression", :with => expression
  click_button "Update"
end

Then /^the value at ([A-Z][1-9][0-9]*) should be "([^"]*)"$/ do |cell, value|
  page.find(".#{cell}").should have_content(value)
end
