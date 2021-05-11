class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    resource.class == Admin ? admin_tests_path : tests_path
  end
end
