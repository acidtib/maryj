class API::V1::StrainController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def all
    begin
      status = 200
      
      @strains = Strain.all.limit(2)

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

      @strain = Strain.includes(:category, :effects, :flavors, :conditions, :symptoms).find_by_slug(params['slug'])

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
          flavors: @flavors_array,
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
    

    if params[:search].present?
      @strain = Strain.search(params[:search]).includes(:category, :effects, :flavors, :conditions, :symptoms)
    else
      @strain = Strain.where(nil).includes(:category, :effects, :flavors, :conditions, :symptoms) # creates an anonymous scope    
    end

    if params[:category].present?
      category_array = []
      params[:category].each do |category|
        @category = Category.find_by_slug(category)
        @strain = @strain.category(@category)
        category_array << @strain
      end

      @strain = category_array[0]
    end

    if params[:definition].present?

      if params[:definition][:flavors].present?
        flavors_array = []
        params[:definition][:flavors].each do |flavor|
          @flavor = Flavor.find_by_name(flavor)
          @flavor = @strain.joins(:flavor_items).where("flavor_items.flavor_id = ?", @flavor)
          flavors_array << @flavor
        end

        @strain = flavors_array[0]
      end

      if params[:definition][:effects].present?
        effects_array = []
        params[:definition][:effects].each do |effect|
          @effect = Effect.find_by_name(effect)
          @effect = @strain.joins(:effect_items).where("effect_items.effect_id = ?", @effect)
          effects_array << @effect
        end

        @strain = effects_array[0]
      end

      if params[:definition][:conditions].present?
        conditions_array = []
        params[:definition][:conditions].each do |condition|
          @condition = Condition.find_by_name(condition)
          @condition = @strain.joins(:condition_items).where("condition_items.condition_id = ?", @condition)
          conditions_array << @condition
        end

        @strain = conditions_array[0]
      end

      if params[:definition][:symptoms].present?
        symptoms_array = []
        params[:definition][:symptoms].each do |symptom|
          @symptom = Symptom.find_by_name(symptom)
          @symptom = @strain.joins(:symptom_items).where("symptom_items.symptom_id = ?", @symptom)
          symptoms_array << @symptom
        end

        @strain = symptoms_array[0]
      end

    end

    @search_response = @strain.map do |strain|
      {
        id: strain.id,
        name: strain.name,
        slug: strain.slug,
        category: strain.category.name
      }
    end

    @response = {
      meta: {
        code: 200
      },
      data: {
        search: @search_response
      }
    }

    render json: @response
  end
end
