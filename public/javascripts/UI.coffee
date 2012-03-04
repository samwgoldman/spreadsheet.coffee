class window.UI
  constructor: (@table) ->

  run: =>
    parent = @table.parent()
    @table.width(parent.innerWidth(true))
    if parent.is("body")
      margin = parseFloat(parent.css("marginTop")) + parseFloat(parent.css("marginBottom"))
      padding = parseFloat(parent.css("paddingTop")) + parseFloat(parent.css("paddingBottom"))
      @table.height($(window.document).height() - margin - padding)
    else
      @table.height(parent.innerHeight(true))
