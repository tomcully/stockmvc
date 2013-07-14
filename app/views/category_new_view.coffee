class App.CategoryNewView extends Mozart.View
  templateName: 'app/templates/category_new_view'
  classHtml: 'main'

  init: =>
    super
    @set 'errors', false

  createNew: =>
    unless @newName? and @newName.length>0
      errors = []
      unless @newName? and @newName.length>0 
        errors.push("Name must not be blank")
      @set 'errors', errors
      return

    newCategory = App.categoriesController.createNew(@newName)

    App.categoriesController.setActive(newCategory)
    App.categoriesController.navigateToCurrent()
