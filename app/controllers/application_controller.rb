class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_store

  def set_current_store
    @current_store = Store.current_store
  end
end
