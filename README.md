# Team 15 · Global Childhood Vaccination (1980–2024)

CS333 Information Visualization group project exploring how routine childhood vaccination rose globally, where coverage still lags, and how COVID-19 disrupted progress.

## Live preview

Open the final visualization in a browser:

- **GitHub Pages** (once enabled): [https://sallyjoo18.github.io/information_visualization/](https://sallyjoo18.github.io/information_visualization/)
- **Preview link** (works now): [htmlpreview](https://htmlpreview.github.io/?https://raw.githubusercontent.com/sallyjoo18/information_visualization/main/final/submission_prototype.html)

Locally, open `final/submission_prototype.html` in a browser, or start from the repo root `index.html` redirect.

## Repository layout

```
├── README.md                          # This file
├── index.html                         # Redirects to the final visualization
├── global-vaccination-coverage.Rproj  # RStudio project (repo root)
│
├── final/                             # Submission deliverable
│   ├── submission_prototype.html      # Interactive scrollytelling page (D3)
│   ├── submission_prototype.pdf       # Exported static PDF
│   └── export_submission_pdf.mjs      # Regenerate PDF via Puppeteer + Chrome
│
├── initial-exploration/               # Early project work
│   ├── Initial Exploration.pdf
│   ├── initial_exploration.qmd        # Quarto source
│   ├── initial_exploration.html       # Rendered report
│   ├── initial_exploration_files/     # Quarto HTML assets
│   └── data_exploration/              # EDA scripts, plots, and .rda outputs
│
├── data/                              # Source datasets
│   ├── global-vaccination-coverage.csv
│   ├── global-vaccination-coverage.metadata.json
│   ├── gdp-per-capita-worldbank.csv
│   ├── countries-110m.json            # Local fallback for world map
│   └── OWID_README.md                 # Our World in Data data documentation
│
└── .github/workflows/
    └── deploy-pages.yml               # GitHub Pages deploy on push to main
```

## Story structure

The final page (`final/submission_prototype.html`) is a four-level scrollytelling narrative:

1. **Global rise** — World-average coverage for polio, pneumococcal, and rubella (1980–2024)
2. **Geographic inequality** — Three vaccine maps that zoom into Africa and highlight Sudan
3. **Wealth & coverage** — GDP vs. polio scatter plot with overperformers and Sudan at the bottom
4. **COVID disruption** — National drops and global recovery timeline

Disease colors are consistent throughout: polio (blue), pneumococcal (red), rubella (purple).

## Data sources

| File | Source |
|------|--------|
| `global-vaccination-coverage.csv` | [Our World in Data — Vaccination coverage](https://ourworldindata.org/grapher/global-vaccination-coverage) (WHO/UNICEF estimates) |
| `gdp-per-capita-worldbank.csv` | World Bank GDP per capita |
| `countries-110m.json` | [world-atlas](https://github.com/topojson/world-atlas) (Natural Earth, 110m) |

All chart data for the final HTML is embedded inline; the map tries `data/countries-110m.json` locally, then CDN fallbacks.

## Development

### View the visualization

```bash
open final/submission_prototype.html
# or
open index.html
```

### Export PDF

Requires Google Chrome and Puppeteer:

```bash
cd final
npm install puppeteer-core   # one-time, if not already installed
node export_submission_pdf.mjs
```

### Re-render initial exploration (Quarto)

```bash
quarto render initial-exploration/initial_exploration.qmd
```

### Run EDA (R)

Open `global-vaccination-coverage.Rproj` in RStudio and run scripts in `initial-exploration/data_exploration/`.

## Team

**Team 15** · CS333 Information Visualization
