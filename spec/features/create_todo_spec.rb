require 'rails_helper'

RSpec.describe "Task creator", type: :feature do
  scenario "an user create a new task" do
    visit new_task_path
    fill_in "task[description]", with: "A new task"
    select "Medium", from: "task[priority]"

    click_on "Save!"

    expect(current_path).to eq(tasks_path)
    expect(page).to have_content("New task created succesfully")
    expect(Task.all.count).to eq(1)
  end
end
