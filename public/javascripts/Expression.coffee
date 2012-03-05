class window.Expression
  constructor: (@sheet) ->

  solve: (expression) =>
    data = @sheet.data
    try
      value = eval("with (data) { " + expression + "}")
    catch error
      value = expression
    value
