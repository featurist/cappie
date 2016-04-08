When /^I open my app$/ do
  visit '/'
end

Then /^my client\-side script is executed$/ do
  expect(page).to have_content("text created by client-side script")
end

Then /^environment variables are set in the app process$/ do
  expect(page).to have_content("foo")
  expect(page).to have_content("bar")
end
