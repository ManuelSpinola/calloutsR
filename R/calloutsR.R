#' @title Callout con ícono y soporte Markdown
#' @name callout_block_md
#' @description
#' Genera un bloque de estilo "callout" personalizable con:
#' - Ícono (emoji o HTML)
#' - Título opcional
#' - Texto con soporte Markdown
#'
#' Útil en documentos **RMarkdown** o **Quarto** para destacar contenido
#' dentro de un bloque estilizado.
#'
#' @param texts Vector de cadenas con el contenido del bloque (en formato Markdown).
#' @param title Texto del título (opcional, también en Markdown).
#' @param icon Ícono a mostrar antes de cada texto (por defecto un check ✅).
#' @param title_size Tamaño del título en px (ej. "24px").
#' @param text_size Tamaño del texto en px (ej. "16px").
#' @param width Ancho del bloque (ej. "100%").
#' @param bgcolor Color de fondo del bloque.
#' @param color Color del texto.
#' @param border_radius Radio de las esquinas (ej. "10px").
#' @param padding Espaciado interno (ej. "10px").
#' @param gap Separación entre ícono y texto (ej. "10px").
#' @param icon_size Tamaño del ícono (ej. "24px").
#'
#' @return Un objeto HTML que se renderiza como un bloque estilizado en Quarto/RMarkdown.
#'
#' @examples
#' if (interactive()) {
#'   callout_block_md(
#'     title = "Hipótesis y método científico",
#'     texts = c(
#'       "**Primera viñeta:** Hipótesis científica",
#'       "**Segunda viñeta:** Método hipotético-deductivo",
#'       "**Tercera viñeta:** Limitaciones en ecología"
#'     ),
#'     icon = "🐾",
#'     bgcolor = "#e0f7fa",
#'     color = "#006064",
#'     title_size = "28px",
#'     text_size = "18px",
#'     border_radius = "15px",
#'     padding = "15px",
#'     gap = "12px",
#'     icon_size = "22px"
#'   )
#' }
#'
#' @export
#' @import htmltools
#' @import markdown

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
