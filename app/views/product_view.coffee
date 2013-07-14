class App.ProductView extends Mozart.View
  templateName: 'app/templates/product_view'
  contentObserveBinding: 'App.productsController.current'
  classHtml: 'main'

  init: ->
    super
    @bind('change:content', @updateContent)
    @bind('change:name', @checkDirty)
    @bind('change:stock_level', @checkDirty)

  afterRender: =>
    @updateContent()

  updateContent: =>
    @set('name', @content.name)
    @set('stock_level', @content.stock_level)

  save: =>
    @content.set('name', @name)
    @content.set('stock_level', @stock_level)
    @content.save()

    App.categoriesController.navigateToCurrent()

  cancel: =>
    @updateContent()

  checkDirty: =>
    @set 'isDirty', @name != @content.name or @stock_level != @content.stock_level