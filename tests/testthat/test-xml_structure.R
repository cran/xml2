test_that("xml_structure", {
  expect_output(
    xml_structure(read_xml("<a><b><c/><c/></b><d/></a>")),
    "<a>
  <b>
    <c>
    <c>
  <d>"
  )

  expect_output(
    xml_structure(read_xml("<a><b><c/><c/></b><d/></a>"), indent = 0L),
    "<a>
<b>
<c>
<c>
<d>"
  )
})

test_that("xml_structure can write to a file (#244)", {
  tmp <- tempfile()
  xml_structure(read_xml("<a><b><c/><c/></b><d/></a>"), file = tmp)
  expect_equal(readLines(tmp), c("<a>", "  <b>", "    <c>", "    <c>", "  <d>"))

  # repeated calls erase existing content
  xml_structure(read_xml("<a><b><c/><c/></b><d/></a>"), file = tmp)
  expect_equal(readLines(tmp), c("<a>", "  <b>", "    <c>", "    <c>", "  <d>"))
})

test_that("xml_structure is correct", {
  x <- read_html(test_path("lego.html.bz2"))

  quicklinks <- xml_find_first(x, "//div[contains(@div, 'quicklinks')]")
  expect_snapshot(html_structure(quicklinks))
})
