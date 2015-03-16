require "rails_helper"

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe ".not_done" do
    it "returns all the 'not done' tasks" do
      list = List.create(:name => "list", :description => "description")
      task1 = Task.create(:description => "task1", :list_id => list.id)
      task2 = Task.create(:description => "task2", :list_id => list.id)
      task1.mark_not_done
      task2.mark_not_done
      expect(list.tasks.not_done).to eq [task1,task2]
    end
  end
  describe ".done" do
    it "returns all the 'done' tasks" do
      list = List.create(:name => "list2", :description => "description")
      task1 = Task.create(:description => "task1", :list_id => list.id)
      task2 = Task.create(:description => "task2", :list_id => list.id)
      task1.mark_done
      task2.mark_done
      expect(list.tasks.done).to eq [task1,task2]
    end
  end

end
