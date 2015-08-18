class PageController < ApplicationController
  def home
  end

  def dev
    #@category = Category.find_by_name('Sativa')
    #@strain = Strain.where(category_id: @category)

    #@response = @strain.map do |strain|
    #  {
    #    symbol: strain.symbol,
    #    name: strain.name,
    #    slug: strain.slug
    #  }
    #end

    ###############################################

    begin
      # @result = HTTParty.post("http://data.leafly.com/strains", 
      # :body => { :Page => params['page'], 
      #            :Take => 50, 
      #            :Sort => 'alpha', 
      #            :LoadFacets => false
      #          }.to_json,
      # :headers => { 'Content-Type' => 'application/json', 'APP_ID' => 'd56e5058', 'APP_KEY' => 'ae0d842b1f52e9150bb7e63313bdb72b' } )

      @result = JSON.parse(@result.body)

      @result['Strains'].each do |strain|

        case strain['Category']
        when 'Hybrid'
          @category = 3
        when 'Indica'
          @category = 2
        when 'Sativa'
          @category = 1
        when 'Edible'
          @category = 4
        end

        # creating the strain
        @create_strain = Strain.create(
          name: strain['Name'], 
          symbol: strain['Symbol'],
          slug: strain['UrlName'],
          category_id: @category
        )

        # adding the flavors
        strain['Flavors'].each do |flavor|
          @flavor = Flavor.find_by_name(flavor['Name'].downcase)

          if @flavor
            FlavorItem.create(
              strain_id: @create_strain.id,
              flavor_id: @flavor.id
            )
          end
        end

        # adding the symptoms
        strain['Symptoms'].each do |symptom|
          @symptom = Symptom.find_by_name(symptom['Name'].downcase)

          if @symptom
            SymptomItem.create(
              strain_id: @create_strain.id,
              symptom_id: @symptom.id
            )
          end
        end

        # adding the conditions
        strain['Conditions'].each do |condition|
          @condition = Condition.find_by_name(condition['Name'].downcase)

          if @condition
            ConditionItem.create(
              strain_id: @create_strain.id,
              condition_id: @condition.id
            )
          end
        end

        # adding the effects
        strain['Tags'].each do |effect|
          @effect = Effect.find_by_name(effect['Name'].downcase)

          if @effect
            EffectItem.create(
              strain_id: @create_strain.id,
              effect_id: @effect.id
            )
          end
        end
      end
      logger.info "Page: #{params['page']}"
    rescue Exception => e
      logger.info e
      logger.info "WTF"
    end

    
  end
end
