class API::V1::DefinitionController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def conditions
    begin
      status = 200

      @conditions = Condition.all

      @conditions_response = @conditions.map do |condition|
        {
          id: condition.id,
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

      @effects = Effect.all

      @effects_response = @effects.map do |effect|
        {
          id: effect.id,
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

      @flavors = Flavor.all

      @flavors_response = @flavors.map do |flavor|
        {
          id: flavor.id,
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

      @symptoms = Symptom.all

      @symptoms_response = @symptoms.map do |symptom|
        {
          id: symptom.id,
          name: symptom.name
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