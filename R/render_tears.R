render_tear <- function(tear) {
  time <- as.numeric(tear$time)
  angle <- 2 * pi * (time %% 12) / 12
  cx <- 200 + 95 * sin(angle)
  cy <- 200 - 95 * cos(angle)
  
  gr <- ifelse(tear$size == "large", 20, 12)
  sr <- ifelse(tear$size == "large", 15, 8)
  
  rotation <- glue::glue("rotate({angle * 180 / pi}, {cx}, {cy})")
  path_d <- glue::glue("M{cx - sr},{cy} A{gr},{gr} 0 0,0 {cx + sr},{cy} A{sr},{sr} 0 0,1 {cx - sr},{cy} Z")
  
  glue::glue('<path d="{path_d}" fill="red" stroke="blue" stroke-width="2" transform="{rotation}" />')
}

render_tears <- function(tears_list) {
  if (is.null(tears_list)) return("")
  
  tears <- list()
  for (i in 1:nrow(tears_list)) {
    tears <- c(tears, render_tear(tears_list[i,]))
  }

  stringr::str_c(tears, collapse = "\n")
}