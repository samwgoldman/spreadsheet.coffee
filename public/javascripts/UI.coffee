class window.UI
  constructor: (@table, @form) ->
    @parent = @table.parent()
    @sheet = new Sheet()

  run: =>
    @handleResize()

    @table.click (event) =>
      if event.target.tagName is "TD"
        @currentCell = $(event.target)

    if @form
      @form.submit (event) =>
        expression = event.target.elements["expression"].value
        value = new Expression(@sheet).solve(expression)
        @sheet.setCell(@currentCell.attr("class"), value)
        @currentCell.text(value)
        event.preventDefault()

  # @private
  handleResize: =>
    [width, height] = @measure()
    @table.width(width)
    @table.height(height)
    setTimeout(@handleResize, 100)

  # @private
  measure: =>
    width = @parent.innerWidth()
    if @parent.is("body")
      margin = parseFloat(@parent.css("marginTop")) + parseFloat(@parent.css("marginBottom"))
      padding = parseFloat(@parent.css("paddingTop")) + parseFloat(@parent.css("paddingBottom"))
      height = $(window).height() - margin - padding
    else
      height = @parent.innerHeight(true)

    siblings = _.reject(@table.siblings(), (sibling) -> $(sibling).is("script"))
    siblingHeight = _.reduce siblings,
      (height, sibling) -> height + $(sibling).outerHeight(true),
      0
    height -= siblingHeight

    [width, height]
