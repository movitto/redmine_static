class Content < ActiveRecord::Base
  unloadable

  belongs_to :project
  belongs_to :user

  validates_presence_of :project_id, :user_id, :title
end
