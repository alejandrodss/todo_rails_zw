require 'rails_helper'

RSpec.describe 'List ToDo', type: :feature do
  scenario 'An user list todos' do
    Task.create(description: "An important task", priority: 1, status: "pending")
    Task.create(description: "Other task", priority: 2, status: "pending")
    visit tasks_path

    expect(page).to have_content("New task")
    expect(page).to have_content("Description")
    expect(page).to have_content("Priority")
    expect(page).to have_content("Status")
    expect(page).to have_content("Actions")
  end
end
