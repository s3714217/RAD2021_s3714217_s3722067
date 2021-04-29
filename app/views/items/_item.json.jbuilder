json.extract! item, :id, :itemid, :name, :category, :assetname, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
