require 'rails_helper'

RSpec.describe Business, type: :model do

  before do
     @businesses = [
    Business.create(title: 'GymPO',  address: "London",  price: 20,  industry: 'Gym'),
    Business.create(title: 'Flight Room Fitness', address: "Krakov", price: 75, industry: 'Crossfit'),
    Business.create(title: 'Metro Fitness', address: "Paris", price: 55, industry: 'Crossfit'),
    Business.create(title: 'Gym For Fit', address: "Kharkiv", price: 40, industry: 'Gym'),
    Business.create(title: 'Sport', address: "Rome", price: 50, industry: 'Crossfit')
  ]

    @locations = [
    Location.create(description:'it left', business_id: 1, address:'NY'),
    Location.create(description:'it right', business_id: 1, address:'Paris'),
    Location.create(description:'it for women', business_id: 2, address:'Sydney'),
    Location.create(description:'it for man', business_id: 3, address:'Kharkiv'),
    Location.create(description:'it for boy', business_id: 3, address:'Kiev'),
    Location.create(description:'it for girl', business_id: 4, address:'Rome'),
    Location.create(description:'it for baby', business_id: 4, address:'Hong Kong'),
    Location.create(description:'it for dogs', business_id: 5, address:'Milan'),
    Location.create(description:'it for cats', business_id: 5, address:'California')
  ]

  end

  describe 'filter price and industry'
   it 'filter where given params price and indystry' do
     params = {}
     params[:price] = '30'
     params[:industry] = 'Gym'
     expect(Business.price_industry_filter(params)).to contain_exactly(@businesses[0])
   end

   it 'filter where given only params price' do
     params = {}
     params[:price] = '40'
     expect(Business.price_industry_filter(params)).to contain_exactly(@businesses[0], @businesses[3])
   end

   it 'filter where given only params indystry' do
     params = {}
     params[:industry] = 'Crossfit'
     expect(Business.price_industry_filter(params)).to contain_exactly(@businesses[1], @businesses[2], @businesses[4])
   end

   it 'filter where don`t given any params' do
     params = {}
     expect(Business.price_industry_filter(params)).to contain_exactly(@businesses[0], @businesses[1], @businesses[2], @businesses[3], @businesses[4])
   end

  describe 'filter order_by'
    it 'sort by params price in ascending order' do
      params = {}
      params[:order_by] = 'price'
      params[:order_to] = 'ASC'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([1, 4, 5, 3, 2])
    end

    it 'sort by params price in decreasing order' do
      params = {}
      params[:order_by] = 'price'
      params[:order_to] = 'DESC'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([2, 3, 5, 4, 1])
    end

    it 'sort by params industry in alphabetical order' do
      params = {}
      params[:order_by] = 'industry'
      params[:order_to] = 'ASC'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([2, 3, 5, 1, 4])
    end

    it 'sort by params industry in reverse alphabetical order' do
      params = {}
      params[:order_by] = 'industry'
      params[:order_to] = 'DESC'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([1, 4, 2, 3, 5])
    end

    it 'sort by params industry without instructions in what order' do
      params = {}
      params[:order_by] = 'industry'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([2, 3, 5, 1, 4])
    end

    it 'sort by params industry without instructions in what order' do
      params = {}
      params[:order_by] = 'price'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([1, 4, 5, 3, 2])
    end

    it 'sort by params without any instructions' do
      params = {}
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([1, 2, 3, 4, 5])
    end

    it 'sort by params industry distance' do
      params = {}
      params[:order_by] = 'distance'
      business_ids = [1, 2, 3, 4, 5]
      desired_order_for_sort = Business.order_by(params, business_ids).ids
      expect(desired_order_for_sort).to eql([1, 2, 3, 4, 5])
    end

  describe 'filter business_filter'
    it 'business filter where not include suitable locations' do
      params = {}
      business_ids = []
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([])
    end

    it 'business filter where not include suitable locations and given all params' do
      params = {}
      params[:order_by] = 'price'
      params[:order_to] = 'ASC'
      params[:price] = '30'
      params[:industry] = 'Gym'
      business_ids = []
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([])
    end

    it 'business filter where filter only price' do
      params = {}
      params[:price] = '50'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([1, 4, 5])
    end

    it 'business filter where filter only industry' do
      params = {}
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([2, 3, 5])
    end

    it 'business filter where filter price and industry' do
      params = {}
      params[:price] = '60'
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([3, 5])
    end

    it 'business filter where filter price and industry and sort by distance' do
      params = {}
      params[:order_by] = 'distance'
      params[:price] = '80'
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([2, 3, 5])
    end

    it 'business filter where filter price and industry and sort by price without instructions in what order' do
      params = {}
      params[:order_by] = 'price'
      params[:price] = '80'
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([5, 3, 2])
    end

    it 'business filter where filter price and industry and sort by price in ascending order' do
      params = {}
      params[:order_by] = 'price'
      params[:order_to] = 'ASC'
      params[:price] = '80'
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([5, 3, 2])
    end

    it 'business filter where filter price and industry and sort by price in decreasing order' do
      params = {}
      params[:order_by] = 'price'
      params[:order_to] = 'DESC'
      params[:price] = '80'
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([2, 3, 5])
    end

    it 'business filter where filter price and industry and sort by industry in alphabetical order' do
      params = {}
      params[:order_by] = 'industry'
      params[:order_to] = 'DESC'
      params[:price] = '80'
      params[:industry] = 'Crossfit'
      business_ids = Business.price_industry_filter(params).ids
      desired_order_for_business_filter = Business.business_filter(params, business_ids).ids
      expect(desired_order_for_business_filter).to eql([2, 3, 5])
    end

end
