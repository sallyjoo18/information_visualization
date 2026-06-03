# Demo Script — Global Vaccination Coverage

---

## Opening, Dataset & Goals

Hello everyone, thank you all for being here today. My name is Daniel, and I am presenting on behalf of Team 15. My other teammates have left for the quarter, so it would just be me today. Anyways, for our visualization, we covered the story of global vaccination from when the movement began about 4 decades ago to today.

For our datasets, we have two primary ones. The first is the global vaccination data itself from the WHO covering the past 40 years. It contains data from nearly all countries around the globe for 9 different vaccines. Something of note is that there are missing data points, due to the fact that some nations simply do not gather or report such data, or have inaccuracies, but the gaps are rather minimal and we were still able to construct a very comprehensive visualization.

Our second dataset is GDP per capita data from the World Bank. We conducted a wealth analysis to vaccination rate across nations which I will elaborate further on in the communication goals.

So for our communication goals, we had four. First, trace the global rise — how vaccination climbed from almost nothing to near-universal over the past four decades. Second, highlight geographic inequality — show where the gaps actually are on a map and whether the same countries keep falling behind across different vaccines. Third, explore structural drivers — specifically, does national wealth explain who vaccinates well and who does not. That is where the GDP data comes in. And fourth, examine COVID disruption — what happened to all that progress when the pandemic hit. Each of these maps directly to one of our four visualizations, and they are meant to be experienced in order because each one raises the question that the next one answers.

A quick note on our design approach: we keep color consistent throughout — polio is always blue, pneumococcal is always red, rubella is always purple — so once you learn it in the first chart, you do not have to relearn it. And we use scrollytelling to build up the data progressively rather than dumping everything on screen at once.

Let me walk you through each visualization.

---

## Visualization 1 — Global Rise (Line Chart)

This is our first visualization, a multi-line time series showing world-average coverage from 1980 to 2024.

We start with empty axes on purpose. In 1980, fewer than one in four children received routine immunization, and we want that to sink in before any lines appear. Polio draws in first in blue — it has the longest data series and was the first vaccine to be scaled globally. You will see a marker at 1988 when the WHO launched the Global Polio Eradication Initiative. Then pneumococcal and rubella come in on the same chart. We put all three together so you can immediately see that newer vaccines lag decades behind even though they use the same clinics and cold chains. Finally the WHO 90% target appears — that is the coverage level where outbreaks have trouble spreading. Older vaccines like polio are approaching it, but newer ones like pneumococcal still have a ways to go.

So the global average paints a pretty good picture overall, but it hides where children are actually still being missed. That is what the next visualization digs into.

---

## Visualization 2 — Geographic Inequality (Maps)

This is our second visualization — three choropleth maps side by side, one for polio, one for pneumococcal, one for rubella, all showing 2024 data.

We went with side-by-side rather than a toggle so you can compare all three at a glance. And what jumps out right away is that the same pale countries show up across all three maps. This is not just one vaccine program failing — low coverage clusters by geography, not by disease.

As you scroll, the view zooms into Africa and dims everything else. Dozens of countries here are still below 70% on all three vaccines — and the reasons are structural: rural distance, stock-outs, underfunded primary care, conflict. We end by calling out Sudan specifically — about 40% on polio and pneumococcal, 46% on rubella, some of the lowest numbers anywhere. We highlight it by name because a specific country sticks in your mind more than a shaded polygon, and Sudan keeps coming back throughout the rest of our story.

So now the question becomes: are these geographic clusters just a wealth thing? Is it simply that poorer countries vaccinate less? That is what the next visualization tests.

---

## Visualization 3 — Wealth & Coverage (Scatter Plot)

This is our third visualization — a scatter plot of GDP per capita versus polio coverage for every country in 2024, with GDP on a log scale.

We show the raw scatter first with no trend line so you can take in just how much variation there is at every income level. Then the trend line fades in — richer countries do tend to vaccinate more, but the spread around that line is wide. Wealth explains part of it, but clearly not all of it.

Then we highlight overperformers in green — low-income countries that are beating their predicted coverage by at least eight points. We show these first on purpose, before we show the underperformers, because we do not want the takeaway to be "poor countries cannot vaccinate." Some of them clearly can. Then Sudan appears in orange at the very bottom — far below where the trend line would predict, because conflict and a strained health system break the usual link between income and outcomes.

So after decades of building up this progress, could a single global shock set it back? That is what the last visualization looks at.

---

## Visualization 4 — COVID Disruption (Stat Cards + Charts)

This is our fourth and final visualization.

We lead with stat cards before any charts appear, because the main insight here is a contrast. World polio coverage dropped five points from 2019 to 2021 — 86% down to 81%. But Myanmar dropped fifty-three points, from 90% to 37%. And twenty-one countries lost at least ten. A modest global dip and a catastrophic national collapse happening at the same time — that is easy to miss if you just look at a line chart.

On the left we have a dumbbell chart showing before-and-after at the country level, ordered from smallest drop to largest. We use white and orange here instead of the vaccine colors because this section is about the disruption itself, not comparing diseases. On the right, a timeline of global polio coverage with a shaded band over the COVID years shows the dip and partial recovery. By 2024, the world has come back somewhat but is still sitting below its 2019 peak.

And that is really the message we want to leave you with: childhood vaccination is one of public health's greatest achievements, but the children still being missed are concentrated in the same fragile places, and COVID showed just how quickly decades of progress can slip. Thank you.
