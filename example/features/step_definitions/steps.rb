When /^I open my app$/ do
  visit '/'
end

Then /^my client\-side script is executed$/ do
  expect(page).to have_content("text created by client-side script")
end

Then /^I see the environment variables$/ do
  expect(page).to have_content("foo")
  expect(page).to have_content("bar")
end
