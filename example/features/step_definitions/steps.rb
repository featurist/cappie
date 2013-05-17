When /^I open my app$/ do
  visit '/'
end

Then /^my client\-side script is executed$/ do
  page.should have_content("text created by client-side script")
end

Then /^I see the environment variables$/ do
  page.should have_content("foo")
  page.should have_content("bar")
end
