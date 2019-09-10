require 'rails_helper'

RSpec.describe Location, type: :model do

  describe 'filter location for many locations'
    before do
      @businesses = [
      Business.create(title: 'bus 1', address: 'London', price: 24),
      Business.create(title: 'bus 2', address: 'Paris', price: 40)
    ]
      @locations = [
      Location.create(description:'it left', business_id: 1, address:'Rome'),
      Location.create(description:'it right', business_id: 1, address:'Paris'),
      Location.create(description:'it for women', business_id: 2, address:'Sydney'),
      Location.create(description:'it for man', business_id: 2, address:'Kharkov')
    ]
      @user_location = [43.6307863, -74.4659275]
    end

    it 'filter locations where given params location and miles' do
      params = {}
      params[:location] = 'Rome'
      params[:miles] = 20
      expect(Location.filter_location(params, @user_location)).to contain_exactly(@locations[0])
    end

    it 'filter locations where given only params location' do
      params = {}
      params[:location] = 'Rome'
      params[:miles] = ''
      expect(Location.filter_location(params, @user_location)).to contain_exactly(@locations[0], @locations[1], @locations[2], @locations[3])
    end

    it 'filter locations where given only params miles' do
      params = {}
      params[:location] = ''
      params[:miles] = 20
      expect(Location.filter_location(params, @user_location)).to contain_exactly()
    end

    it 'filter locations where don`t given any params' do
      params = {}
      params[:location] = ''
      params[:miles] = ''
      expect(Location.filter_location(params, @user_location)).to contain_exactly(@locations[0],@locations[1], @locations[2], @locations[3])
    end

    it 'filter locations where given params location and miles and defined current user`s location' do
      params = {}
      params[:location] = 'Rome'
      params[:miles] = 20
      @user_location = 'Kiev'
      expect(Location.filter_location(params, @user_location)).to contain_exactly(@locations[0])
    end

    it 'filter locations where don`t given params location and miles and defined current user`s location' do
      params = {}
      params[:location] = ''
      params[:miles] = ''
      @user_location = 'Kiev'
      expect(Location.filter_location(params, @user_location)).to contain_exactly(@locations[0],@locations[1],@locations[2],@locations[3])
    end
  end
