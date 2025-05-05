test_that("render_tear runs example1$tears", {
  json_file <- system.file("extdata/json", "example1.json", package = "fundusSVG")
  example1 <- jsonlite::fromJSON(json_file)
  
  expect_no_error(render_tear(example1$tears))
  expect_equal(render_tear(example1$tears), '<path d="M287,200 A12,12 0 0,0 303,200 A8,8 0 0,1 287,200 Z" fill="red" stroke="blue" stroke-width="2" transform="rotate(90, 295, 200)" />')
})

test_that("render_tears runs example1", {
  json_file <- system.file("extdata/json", "example1.json", package = "fundusSVG")
  example1 <- jsonlite::fromJSON(json_file)
  
  expect_no_error(render_tears(example1$tears))
  expect_equal(render_tears(example1$tears), "<path d=\"M287,200 A12,12 0 0,0 303,200 A8,8 0 0,1 287,200 Z\" fill=\"red\" stroke=\"blue\" stroke-width=\"2\" transform=\"rotate(90, 295, 200)\" />")
})