class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    Bakery.all.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all
    baked_goods.order(price: :desc).to_json
  end
  
  get '/baked_goods/most_expensive' do
    BakedGood.all.order(price: :desc).first.to_json
  end

end
