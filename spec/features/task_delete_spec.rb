require 'rails_helper'

RSpec.describe "Task delete" do
  scenario "An user delete a task" do
    Task.create(description: "An important task", priority: "High")
    task2 = Task.create(description: "Other task", priority: "Medium")

    visit tasks_path

    within "#task_#{task2.id}" do
      click_on "Delete"
    end

    expect(current_path).to eq(tasks_path)
    expect(page).to have_content("The task was deleted")
    expect(Task.all.count).to eq(1)
  end
end
