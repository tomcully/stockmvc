App.Category.hasOne App.Category, 'parent', 'parent_id'
App.Category.hasMany App.Category, 'categories', 'parent_id' 

App.Category.hasMany App.Product, 'products', 'category_id'
App.Product.belongsTo App.Category, 'category', 'category_id'