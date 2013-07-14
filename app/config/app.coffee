App.categoriesController = App.CategoriesController.create()
App.productsController = App.ProductsController.create()

Mozart.root = window

App.Application = Mozart.MztObject.create()

App.Application.set 'sidebarLayout', Mozart.Layout.create(
  rootElement: '#sidebar'
  states: [
    Mozart.Route.create
      viewClass: App.SidebarView
      path: "/"
  ]
)

App.Application.set 'mainLayout', Mozart.Layout.create(
  rootElement: '#main'
  states: [
    Mozart.Route.create
      viewClass: App.MainView
      path: "/"

    Mozart.Route.create
      viewClass: App.CategoryNewView
      path: "/categories/new"
      enter: (data) =>
        App.categoriesController.setActiveById(null)
        true
        
    Mozart.Route.create
      viewClass: App.CategoryView
      path: "/categories/:id"
      enter: (data) =>
        App.categoriesController.setActiveById(data.id)

    Mozart.Route.create
      viewClass: App.CategoryNewView
      path: "/categories/:id/new"
      enter: (data) =>
        App.categoriesController.setActiveById(data.id)
        true
    
    Mozart.Route.create
      viewClass: App.ProductView
      path: "/products/:id"
      enter: (data) =>
        App.productsController.setActiveById(data.id)

    Mozart.Route.create
      viewClass: App.ProductNewView
      path: "/categories/:id/newproduct"
      enter: (data) =>
        App.categoriesController.setActiveById(data.id)
        true
  ]
)

App.Application.ready = ->
  App.Application.set 'domManager', Mozart.DOMManager.create(
    rootElement: 'body'
    layouts: [ 
      App.Application.sidebarLayout
      App.Application.mainLayout
    ]
  )

  App.Application.sidebarLayout.bindRoot()
  App.Application.sidebarLayout.navigateRoute('/')

  App.Application.mainLayout.bindRoot()
  App.Application.mainLayout.start()

  $(document).trigger('Mozart:loaded')

$(document).ready(App.Application.ready)
    
