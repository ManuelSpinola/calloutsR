
<!-- README.md is generated from README.Rmd. Please edit that file -->

# calloutsR

<!-- badges: start -->

<!-- badges: end -->

El paquete **calloutsR** permite crear bloques de estilo tipo “callout”
en documentos R Markdown o Quarto.

## Installation

You can install the development version of calloutsR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ManuelSpinola/calloutsR")
```

## Example

This is a basic example:

``` r
library(calloutsR)

callout_block_md(
  title = "Hipótesis y método científico",
  texts = c(
    "Primera viñeta: Hipótesis científica",
    "Segunda viñeta: Método hipotético-deductivo",
    "Tercera viñeta: Limitaciones en ecología"
  ),
  icon = "🐾",
  bgcolor = "#e0f7fa",
  color = "#006064"
)
```

<div style="width:100%; background-color:#e0f7fa; border-radius:10px; padding:10px; margin:10px 0;">
<div style="font-size:24px; font-weight:bold; margin-bottom:0.5em;"><p>Hipótesis y método científico</p>
</div>
<div style="display:flex; align-items:flex-start; gap:10px; margin-bottom:0.5em;">
<span style="font-size:24px;">🐾</span>
<span style="font-size:16px; color:#006064;"><p>Primera viñeta: Hipótesis científica</p>
</span>
</div>
<div style="display:flex; align-items:flex-start; gap:10px; margin-bottom:0.5em;">
<span style="font-size:24px;">🐾</span>
<span style="font-size:16px; color:#006064;"><p>Segunda viñeta: Método hipotético-deductivo</p>
</span>
</div>
<div style="display:flex; align-items:flex-start; gap:10px; margin-bottom:0.5em;">
<span style="font-size:24px;">🐾</span>
<span style="font-size:16px; color:#006064;"><p>Tercera viñeta: Limitaciones en ecología</p>
</span>
</div>
</div>
