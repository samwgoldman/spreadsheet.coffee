describe "Sheet", ->
  it "can remember cell values", ->
    sheet = new Sheet()
    sheet.setCell("A1", "Hello, World!")
    expect(sheet.getCell("A1")).toEqual("Hello, World!")

  it "knows the unknown", ->
    sheet = new Sheet()
    expect(sheet.getCell("A1")).toEqual(undefined)

  it "takes exception to malformed cell identifiers", ->
    sheet = new Sheet()
    expect(-> sheet.setCell("1A", "Hello, Error!")).toThrow(new Error("1A is not a valid cell identifier."))
    expect(-> sheet.getCell("1A")).toThrow(new Error("1A is not a valid cell identifier."))

  it "takes exception to non-string cell identifiers", ->
    sheet = new Sheet()
    expect(-> sheet.setCell(1, "Hello, Error!")).toThrow(new Error("1 is not a valid cell identifier."))
    expect(-> sheet.getCell(1)).toThrow(new Error("1 is not a valid cell identifier."))

  it "is fine with String objects as cell identifiers", ->
    sheet = new Sheet()
    cell = new String("A1")
    sheet.setCell(cell, "Hello, World!")
    expect(sheet.getCell(cell)).toEqual("Hello, World!")
    expect(sheet.getCell("A1")).toEqual("Hello, World!")

  it "exposes its data as an Object", ->
    sheet = new Sheet()
    sheet.setCell("A1", 1)
    sheet.setCell("A2", "hi")
    expect(sheet.data).toEqual(A1: 1, A2: "hi")
