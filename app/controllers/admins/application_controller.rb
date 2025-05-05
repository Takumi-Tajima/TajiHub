class Admins::ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_admin!
  layout 'admin'
end
