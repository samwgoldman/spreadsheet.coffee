describe "Expression", ->
  beforeEach ->
    @sheet = new Sheet()

  it "can do simple math", ->
    equation = new Expression(@sheet)
    expect(equation.solve("1 + 1")).toEqual(2)

  it "can reference cells from the given sheet", ->
    @sheet.setCell("A1", 1)
    @sheet.setCell("A2", 2)
    equation = new Expression(@sheet)
    expect(equation.solve("A1 + A2")).toEqual(3)
