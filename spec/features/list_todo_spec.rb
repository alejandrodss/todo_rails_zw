require 'rails_helper'

RSpec.describe 'List ToDo', type: :feature do
  scenario 'An user list todos' do
    Task.create(description: "An important task", priority: "High")
    Task.create(description: "Other task", priority: "Medium")
    visit tasks_path

    expect(page).to have_button("New task")
    expect(page).to have_content("Description")
    expect(page).to have_content("Priority")
    expect(page).to have_content("Status")
    expect(page).to have_content("Actions")

    #List
    expect(page).to have_content("An important task")
    expect(page).to have_content("Other task")
    expect(page).to have_button("Modify")
    expect(page).to have_button("Complete")
    expect(page).to have_button("Delete")
  end
end
