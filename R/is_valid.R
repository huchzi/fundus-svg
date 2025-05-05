is_valid <- function(json_data) {
  
  json_schema <- system.file("extdata", "schema_definition.json", package = "fundusSVG")
  
  validation_result <- jsonvalidate::json_validate(json_data, schema = json_schema)
  
  if (!validation_result) {
    cat("Validation failed:\n")
    print(jsonvalidate::json_validate(json_data, schema = json_schema, verbose = TRUE))
    return(FALSE)
  } else {
    return(TRUE)
  }
  
}