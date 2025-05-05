test_that("only side", {
  json_data <- '{"side": "OD"}'
  expect_true(is_valid(json_data))
})

test_that("empty", {
  json_data <- '{}'
  expect_false(is_valid(json_data))
})