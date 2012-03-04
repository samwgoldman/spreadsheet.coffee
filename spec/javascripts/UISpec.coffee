describe "UI", ->

  it "resizes the table to fill its parent", ->
    table = $("<table>")
    $("<div style='width: 800px; height: 600px'>").append(table)
    new UI(table).run()
    expect(table.width()).toEqual(800)
    expect(table.height()).toEqual(600)

  it "resizes the table to fill the window height if parent is body", ->
    body = $(window.document.body)
    body.css("marginTop", 1).css("marginBottom", 1)
    body.css("paddingTop", 1).css("paddingBottom", 1)
    table = $("<table>")
    body.append(table)
    documentHeight = $(window.document).height()
    new UI(table).run()
    expect(table.height()).toEqual(documentHeight - 4)
