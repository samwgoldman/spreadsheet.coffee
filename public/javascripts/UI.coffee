class window.UI
  constructor: (@table) ->
    @parent = @table.parent()

  run: =>
    @handleResize()

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
    [width, height]
