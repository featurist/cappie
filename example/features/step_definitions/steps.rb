When /^I open my app$/ do
  visit '/'
end

Then /^I my client\-side script is executed$/ do
  page.should have_content("text created by client-side script")
end