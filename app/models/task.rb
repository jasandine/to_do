class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true

  def self.not_done
    where(done: false)
  end

  def self.done
    where(done: true)
  end

  def mark_done
    update(done: true)
  end

  def mark_not_done
    update(done: false)
  end
end
