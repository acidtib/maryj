class API::V1::StrainController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def all
    begin
      status = 200
      
      @strains = Strain.all

        @strains_response = @strains.map do |strain|
          {
            id: strain.id,
            name: strain.name,
            slug: strain.slug,
            category: strain.category.name
          }
        end

        @response = {
          meta: {
            code: status
          },
          data: {
            strains: @strains_response
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

  def show
    begin
      status = 200

      @strain = Strain.find_by_slug(params['slug'])

      if @strain

        @conditions_array = @strain.conditions.map do |condition|
          {
            name: condition.name
          }
        end

        @effects_array = @strain.effects.map do |effect|
          {
            name: effect.name
          }
        end

        @flavors_array = @strain.flavors.map do |flavor|
          {
            name: flavor.name
          }
        end

        @symptoms_array = @strain.symptoms.map do |symptom|
          {
            name: symptom.name
          }
        end

        @strain_response = {
          id: @strain.id,
          name: @strain.name,
          slug: @strain.slug,
          category: @strain.category.name,
          conditions: @conditions_array,
          effects: @effects_array,
          flavor: @flavors_array,
          symptoms: @symptoms_array
        }

        @response = {
          meta: {
            code: status
          },
          data: {
            strain: @strain_response
          }
        }
      else
        status = 404
        @response = {
          meta: {
            code: status,
            error_message: "Cant find that strain"
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

  def search
    @strain = Strain.where(nil) # creates an anonymous scope

    if params[:category].present?
      strain = nil
      params[:category].each do |category|
        logger.info category
        @category = Category.find_by_slug(category)
        @strain = @strain.category(@category)
        strain = @strain
      end
    end

    render json: @strain
  end
end
