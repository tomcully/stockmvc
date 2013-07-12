class App.CategoriesController extends Mozart.Controller
  
  init: ->
    App.Category.loadAllLocalStorage()
    App.Category.loadAllLocalStorage()

    App.Category.bind('change',@updateTopCategories)
    @updateTopCategories()

    @bind('change:current', @updateBreadcrumb)

  setActive: (id) =>
    cid = App.Category.getLocalStorageClientId(id)
    @set 'current', App.Category.findById(cid)
    @current?

  updateTopCategories: =>
    @set 'items', App.Category.findByAttribute('parent_id', null)

  remove: (view,data) =>
    data.content.destroy()

  createNew: (name) =>
    if @current?
      return @current.categories().createFromValues({name:name})
    else
      return App.Category.createFromValues({name:name})

  updateBreadcrumb: =>
    out = []
    t = @current
    while t?
      out.unshift(t)
      t = App.Category.findById(t.parent_id)
    @set 'breadcrumb', out