class window.Expression
  constructor: (@sheet) ->

  solve: (expression) =>
    data = @sheet.data
    eval("with (data) { " + expression + "}")
