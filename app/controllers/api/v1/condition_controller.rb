class API::V1::ConditionController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def conditions
    begin
      status = 200
      
      @strain = Strain.find_by_slug(params[:slug])

      if @strain
        @conditions_response = @strain.conditions.map do |condition|
          {
            name: condition.name
          }
        end

        @response = {
          meta: {
            code: status
          },
          data: {
            conditions: @conditions_response
          }
        }
      else
        status = 404

        @response = {
          meta: {
            code: status,
            error_message: "Strain not found"
          }
        }
      end
    rescue Exception => e
      status = 500
      error = e
      @response = {
        meta: {
          code: status,
          error_message: error
        }
      }
    end

    render json: @response, status: status
  end

  def effects
    begin
      status = 200
      
      @strain = Strain.find_by_slug(params[:slug])

      if @strain
        @effects_response = @strain.effects.map do |effect|
          {
            name: effect.name
          }
        end

        @response = {
          meta: {
            code: status
          },
          data: {
            effects: @effects_response
          }
        }
      else
        status = 404

        @response = {
          meta: {
            code: status,
            error_message: "Strain not found"
          }
        }
      end
    rescue Exception => e
      status = 500
      error = e
      @response = {
        meta: {
          code: status,
          error_message: error
        }
      }
    end

    render json: @response, status: status
  end

  def flavors
    begin
      status = 200
      
      @strain = Strain.find_by_slug(params[:slug])

      if @strain
        @flavors_response = @strain.flavors.map do |flavor|
          {
            name: flavor.name
          }
        end

        @response = {
          meta: {
            code: status
          },
          data: {
            flavors: @flavors_response
          }
        }
      else
        status = 404

        @response = {
          meta: {
            code: status,
            error_message: "Strain not found"
          }
        }
      end
    rescue Exception => e
      status = 500
      error = e
      @response = {
        meta: {
          code: status,
          error_message: error
        }
      }
    end

    render json: @response, status: status
  end

  def symptoms
    begin
      status = 200
      
      @strain = Strain.find_by_slug(params[:slug])

      if @strain
        @symptoms_response = @strain.symptoms.map do |sumptom|
          {
            name: sumptom.name
          }
        end

        @response = {
          meta: {
            code: status
          },
          data: {
            symptoms: @symptoms_response
          }
        }
      else
        status = 404

        @response = {
          meta: {
            code: status,
            error_message: "Strain not found"
          }
        }
      end
    rescue Exception => e
      status = 500
      error = e
      @response = {
        meta: {
          code: status,
          error_message: error
        }
      }
    end

    render json: @response, status: status
  end
end