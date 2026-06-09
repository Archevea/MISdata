pkgload::load_all(".", quiet = TRUE)

dir.create("man/figures", recursive = TRUE, showWarnings = FALSE)

symbols <- c("AAPL", "MSFT")

stocks <- get_stock(
  symbols = symbols,
  start = "2023-01-01",
  end = "2024-12-31",
  columns = "Close"
)
stocks <- clean_stock(stocks, na_method = "trim")

history_plot <- plot_stock(
  stocks,
  symbols = symbols,
  column = "Close",
  title = "Daily Closing Prices: Apple and Microsoft"
)

ggplot2::ggsave(
  filename = "man/figures/README-stock-history.png",
  plot = history_plot,
  width = 10,
  height = 5,
  dpi = 160,
  bg = "white"
)

apple_forecast <- forecast_stock(
  stocks,
  symbol = "AAPL",
  column = "Close",
  horizon = 30,
  ci_levels = c(80, 95)
)

ggplot2::ggsave(
  filename = "man/figures/README-apple-forecast.png",
  plot = apple_forecast$plot,
  width = 10,
  height = 5,
  dpi = 160,
  bg = "white"
)
