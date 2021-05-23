json.extract! item, :id, :name, :category, :price, :itemdescription, :asseturl, :created_at, :updated_at
json.url item_url(item, format: :json)
