require 'rails_helper'

RSpec.describe CaterersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/caterers').to route_to('caterers#index')
    end

    it 'routes to #show' do
      expect(get: '/caterers/1').to route_to('caterers#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/caterers').to route_to('caterers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/caterers/1').to route_to('caterers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/caterers/1').to route_to('caterers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/caterers/1').to route_to('caterers#destroy', id: '1')
    end
  end
end
