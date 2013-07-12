App.Product = Mozart.Model.create
  modelName: 'Product'

App.Product.attributes
  'name': 'string'
  'stock_level': 'integer'
  'category_id': 'string'

App.Product.index 'category_id'

App.Product.localStorage()