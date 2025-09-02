# R/callouts.R

library(htmltools)
library(markdown)

# Función callout con icono y soporte Markdown
callout_block_md <- function(texts,
                             title = NULL,
                             icon = "✅",          # Emoji o HTML
                             title_size = "24px",
                             text_size = "16px",
                             width = "100%",
                             bgcolor = "#f0f0f0",
                             color = "#000000",
                             border_radius = "10px",
                             padding = "10px",
                             gap = "10px",
                             icon_size = "24px") {

  # Función interna: convierte Markdown a HTML
  render_md <- function(txt) {
    HTML(markdownToHTML(text = txt, fragment.only = TRUE))
  }

  # Título opcional (también Markdown)
  title_html <- if (!is.null(title)) {
    tags$div(
      style = sprintf("font-size:%s; font-weight:bold; margin-bottom:0.5em;", title_size),
      render_md(title)
    )
  } else NULL

  # Crear los textos con icono a la izquierda
  text_html <- lapply(texts, function(txt) {
    tags$div(
      style = sprintf(
        "display:flex; align-items:flex-start; gap:%s; margin-bottom:0.5em;",
        gap
      ),
      tags$span(style = sprintf("font-size:%s;", icon_size), HTML(icon)),
      tags$span(style = sprintf("font-size:%s; color:%s;", text_size, color), render_md(txt))
    )
  })

  # Bloque completo
  tags$div(
    style = sprintf(
      "width:%s; background-color:%s; border-radius:%s; padding:%s; margin:10px 0;",
      width, bgcolor, border_radius, padding
    ),
    title_html,
    text_html
  )
}
