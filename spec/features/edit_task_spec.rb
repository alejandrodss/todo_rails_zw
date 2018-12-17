require 'rails_helper'

RSpec.describe "Task editing" do
  let!(:task1) { Task.create(description: "An important task", priority: "High") }
  let!(:task2) { Task.create(description: "Other task", priority: "Medium") }
  before do
    visit tasks_path
  end
  scenario "An user complete a task" do
    within "#task_#{task1.id}" do
      click_on "Complete"
    end
    task1.reload

    expect(current_path).to eq(tasks_path)
    expect(page).to have_content("The task was updated!")
    expect(task1.status).to eq("complete")
  end
  scenario "An user edit a task" do
    within "#task_#{task2.id}" do
      click_on "Modify"
    end

    expect(current_path).to eq(edit_task_path(task2))
    fill_in "task[description]", with: "The task has have to change"
    click_on "Update!"

    task2.reload
    expect(current_path).to eq(tasks_path)
    expect(page).to have_content("The task was updated!")
    expect(task2.description).to eq("The task has have to change")
  end
end
