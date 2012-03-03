class window.Sheet
  constructor: ->
    @data = new Object()

  setCell: (cell, value) =>
    @validCell(cell)
    @data[cell] = value

  getCell: (cell) =>
    @validCell(cell)
    @data[cell]

  validCell: (cell) ->
    unless @isString(cell) && cell.match(/[A-Z]+[1-9][0-9]*/)
      throw new Error("#{cell} is not a valid cell identifier.")

  isString: (x) ->
    typeof x is "string" or x instanceof String
