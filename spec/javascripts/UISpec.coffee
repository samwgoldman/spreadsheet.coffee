describe "UI", ->

  it "resizes to fill its parent", ->
    table = $("<table>")
    $("<div>").width(800).height(600).append(table)
    new UI(table).run()
    expect(table.width()).toEqual(800)
    expect(table.height()).toEqual(600)

  it "resizes to fill the window height if parent is body", ->
    body = $(window.document.body)
    body.css("marginTop", 1).css("marginBottom", 1)
    body.css("paddingTop", 1).css("paddingBottom", 1)
    table = $("<table>")
    body.append(table)
    documentHeight = $(window.document).height()
    new UI(table).run()
    expect(table.height()).toEqual(documentHeight - 4)

  it "resizes when its parent resizes", ->
    parent = $("<div>").width(100).height(100)
    table = $("<table>")
    parent.append(table)
    new UI(table).run()
    parent.width(800).height(600)
    waitsFor (-> table.width() is 800 and table.height() is 600),
      "the UI to detect the resize", 100 # ms

  it "makes room for its siblings", ->
    parent = $("<div>").width(100).height(100)
    table = $("<table>")
    before = $("<div>").height(10).css("marginBottom", 5)
    after = $("<div>").height(10).css("paddingTop", 5)
    parent.append(before, table, after)
    parent.appendTo(window.document.body)
    new UI(table).run()
    expect(table.height()).toEqual(70)

  it "should update the current cell when the expression changes", ->
    form = $("<form name='expressionEditor'><input name='expression' value='Hello, World!'>")
    table = $("<table><tr><td class='A1'>")
    td = table.find("td")
    ui = new UI(table, form)
    ui.run()
    td.click()
    form.submit (event) -> event.preventDefault() # avoid looping jasmine if this test is broken
    form.submit()
    expect(td.text()).toEqual("Hello, World!")
