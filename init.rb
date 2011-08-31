require 'redmine'

Redmine::Plugin.register :redmine_static do
  name 'Redmine Static plugin'
  author 'Mo Morsi'
  description 'Allows user to upload and view static html files in redmine'
  version '0.5.5'
  url 'http://github.com/movitto/redmine_static'
  author_url 'http://mo.morsi.org'

  project_module :static do
    permission :view_static_content,   :static => [:index, :show]
    permission :manage_static_content, :static => [:new_content, :delete_content]
  end

  menu :project_menu, :static, { :controller => 'static', :action => 'index' }, :caption => 'Static Content', :after => :activity, :param => :project_id
end
