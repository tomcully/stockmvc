class App.ProductNewView extends Mozart.View
  templateName: 'app/templates/product_new_view'
  classHtml: 'main'

  init: =>
    super
    @set 'errors', false

  createNew: =>
    errors = @isValid()
    if errors.length>0
      @set 'errors', errors
      return

    newProduct = App.productsController.createNew(@newName, @newStockLevel)
    @layout.navigateRoute('/products/'+newProduct.getLocalStorageId())

  isValid: =>
    errors = []
    errors.push("Name must not be empty") unless @newName? and @newName.length>0 
    errors.push("Stock Level must be a number and more than zero") unless parseInt(@newStockLevel)>0
    errors 
