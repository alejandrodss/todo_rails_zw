require 'rails_helper'

describe "Task creator", type:feature do
  scenario "an user create a new task" do
    visit new_task_path
    fill_in "Description", with: "A new task"
    fill_in "Priority", with: "Medium"

    click_on "save"

    expect(current_path).to eq(task_path)
    expect(page).to have_content("New task created successfully")
    expect(Task.all.count).to eq(1)
  end
end
