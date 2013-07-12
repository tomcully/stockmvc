class App.ProductsController extends Mozart.Controller
  
  init: ->
    App.Product.loadAllLocalStorage()
    App.Product.loadAllLocalStorage()

  setActive: (id) =>
    cid = App.Product.getLocalStorageClientId(id)
    @set 'current', App.Product.findById(cid)
    @current?