describe "Expression", ->
  beforeEach ->
    @sheet = new Sheet()

  it "can do simple math", ->
    expression = new Expression(@sheet)
    expect(expression.solve("1 + 1")).toEqual(2)

  it "can reference cells from the given sheet", ->
    @sheet.setCell("A1", 1)
    @sheet.setCell("A2", 2)
    expression = new Expression(@sheet)
    expect(expression.solve("A1 + A2")).toEqual(3)

  it "returns the expression if it can't be solved", ->
    expression = new Expression(@sheet)
    expect(expression.solve("Hello, World!")).toEqual("Hello, World!")
