class App.ProductView extends Mozart.View
  templateName: 'app/templates/product_view'
  contentObserveBinding: 'App.productsController.current'
  classHtml: 'main'

  init: ->
    super
    @bind('change:content', @updateBreadcrumb)

  afterRender: =>
    @updateBreadcrumb()

  updateBreadcrumb: =>
    out = ""
    t = App.Category.findById(@content.category_id)
    while t?
      out += " - "+t.name if t?
      t = App.Category.findById(t.parent_id)
    @set 'breadcrumb', 'Root '+out+" - "+@content.name
    true
