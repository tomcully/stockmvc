class App.ProductsController extends Mozart.Controller
  
  init: ->
    App.Product.loadAllLocalStorage()
    App.Product.loadAllLocalStorage()

    @setActive(null)

  setActive: (instance) =>
    @set 'current', instance

  setActiveById: (id) =>
    cid = App.Product.getLocalStorageClientId(id)
    @set 'current', App.Product.findById(cid)
    @current?

  remove: (view,data) =>
    data.content.destroy()

  createNew: (name, stockLevel) =>
    App.categoriesController.current.products().createFromValues
      name: name
      stock_level: stockLevel
