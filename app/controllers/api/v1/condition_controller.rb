class API::V1::ConditionController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def condition
    
  end

  def effect
    
  end

  def flavor
    
  end

  def symptom
    
  end
end