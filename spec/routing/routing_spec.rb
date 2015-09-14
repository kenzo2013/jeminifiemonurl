require 'rails_helper'

describe 'root url' do
  it 'should route to urls#new' do
    get('/').should route_to('urls#new')
  end
end

describe 'Admin routes' do
  it 'should GET to urls#admin' do
    get('urls/admin').should route_to('urls#admin')
  end
end
describe 'click routes' do
  it 'should GET to urls#click' do
    get('urls/click').should route_to('urls#click')
  end
end




