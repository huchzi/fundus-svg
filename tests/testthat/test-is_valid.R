test_that("only side", {
  json_data <- '{"side": "OD"}'
  expect_true(is_valid(json_data))
})

test_that("empty", {
  json_data <- '{}'
  expect_false(is_valid(json_data))
})

test_that("example1", {
  json_data <- paste0(readLines("../../inst/extdata/json/example1.json"), collapse = "\n")
  json_data <- paste0(json_data, "\n")
  expect_true(is_valid(json_data))
})

test_that("complex json", {
  json_data <- '{
  "side": "OD",
  "tears": [
    {
      "time": 3,
      "location": 50,
      "size": "medium",
      "type": "horseshoe",
      "surrounding_treatment": "argon_laser"
    },
    {
      "time": 9,
      "location": 80,
      "size": "small",
      "type": "round",
      "surrounding_treatment": "cryopexy"
    }
  ],
  "lesions": [
    {
      "times": [1, 2, 3],
      "radii": [50, 60, 70],
      "type": "amotio",
      "surrounding_treatment": "argon_laser"
    },
    {
      "times": [7, 8, 9],
      "radii": [40, 55, 65],
      "type": "retinoschisis",
      "surrounding_treatment": "none"
    }
  ]
}'
  expect_true(is_valid(json_data))
})