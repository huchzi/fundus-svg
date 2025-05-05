
test_that("no error with example1", {

  json_file <- system.file("extdata/json", "example1.json", package = "fundusSVG")
  example1 <- jsonlite::fromJSON(json_file)
  
  template_file <- system.file("extdata", "fundus_background.svg", package = "fundusSVG")
  template <- readLines(template_file) |> paste(collapse = "\n")
  
  svg_file <- system.file("extdata/svg", "example1.svg", package = "fundusSVG")
  svg <- readLines(svg_file) |> paste(collapse = "\n")
  
  expect_no_error(generate_svg(example1, template))
  expect_equal(generate_svg(example1, template), svg)
})
