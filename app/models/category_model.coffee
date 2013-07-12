App.Category = Mozart.Model.create
  modelName: 'Category'

App.Category.attributes
  'name': 'string'
  'parent_id': 'string'

App.Category.index 'parent_id'

App.Category.localStorage()