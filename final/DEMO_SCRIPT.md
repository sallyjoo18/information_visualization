# Demo Script — 4 Clips

---

## 1. Global Rise (line chart)

For our first communication goal, to trace the global rise in childhood vaccination, we built a multi-line time series chart. We start with empty axes on purpose — if we showed all three lines at once, then viewers miss the point that vaccination has not always been the status quo and is rather the result of decades of continuous progress. In 1980, fewer than one in four children worldwide received a full course of routine immunization. The blank chart forces that baseline before anything draws in.

We introduce polio first, not because it's the only vaccine that matters, but because it's the longest, most complete series we have — it anchors forty years of history before newer vaccines even exist in the data. The 1988 eradication initiative is the clearest example of vaccination as coordinated global action, so the blue line carries the opening beat.

We then add pneumococcal and rubella in the same frame rather than separate charts. That choice was deliberate: all three rely on the same delivery infrastructure, but their timelines diverge sharply. Pneumococcal didn't roll out globally until around 2008; rubella lagged polio for decades. One chart makes that comparison immediate — progress isn't uniform even at the world-average level.

The WHO 90% benchmark arrives last for the same reason we held the trend line back in later sections — give viewers the full distribution before adding a reference line. Newer vaccines still sit below that target, which is exactly the tension this goal is meant to surface: the global average rose, but ambition and reality still diverge.

---

## 2. Geographic Inequality (maps)

For our second communication goal, to highlight geographic inequality, we built three stacked choropleth maps. We start with a world view on purpose — you need to see the whole planet before zooming, or the scale of the problem reads as regional noise instead of a global pattern.

We rejected a single map with a vaccine toggle. Side-by-side maps let you compare across diseases in one glance, and we reuse the same blue-red-purple encoding from the line chart so viewers aren't learning a new color system. When the same pale countries repeat across all three panels, the argument makes itself: this isn't a broken pneumococcal program or a rubella-specific failure — low coverage clusters geographically.

The scroll zoom into Africa is a narrative device, not decoration. Dimming other continents keeps attention on where the shortfall concentrates without jumping straight to a single case study. Dozens of countries still sit below 70% on all three vaccines — that's the inequality the world-average line from the previous section was hiding.

We end on Sudan because a named country is more memorable than a shaded polygon, and because Sudan carries forward through the rest of the story. At roughly 40% on polio and pneumococcal and 46% on rubella, it's among the lowest anywhere — a concrete answer to the question our first chart raised: if coverage rose globally, who is still being missed?

---

## 3. Wealth & Coverage (scatter plot)

For our third communication goal, to explore structural drivers of coverage, we built a GDP scatter plot. We start with the raw scatter on purpose — no trend line yet. If the line appears first, viewers anchor on the average relationship and never really see the spread. Each dot is a country in 2024; color is continent, which encodes region without adding a second chart or a filter control.

The dashed trend line comes in on the next beat. Richer countries do vaccinate more on average — we don't want to pretend wealth doesn't matter — but the scatter around that line is wide at every income level. That's the core claim of this visualization: GDP explains part of the pattern, not all of it.

We highlight green overperformers before we highlight Sudan. That ordering matters. These are low-income countries sitting at least eight points above where the trend would predict — proof that strong delivery systems can beat expectations. Showing them first keeps the story from collapsing into "poor countries can't vaccinate." Some can't; some clearly can.

Sudan at the bottom is the counterexample. It sits far below trend at about 40% polio coverage — not because GDP is the whole story, but because conflict, displacement, and a strained health system can break the link between resources and outcomes. We use polio here for consistency with the rest of the page, and because it has the most complete country-level coverage in 2024. Sudan ties this section back to the maps: geography and politics, not income alone.

---

## 4. COVID Disruption (stat cards + charts)

For our fourth communication goal, to examine COVID disruption, we built stat cards and paired charts. We start with the headline numbers on purpose — before the charts draw in — because the main insight is a contrast, not a single trend. World polio coverage fell five points from 2019 to 2021 (86% → 81%). Myanmar fell fifty-three points, from 90% to 37%. Twenty-one countries lost at least ten. Those two scales of disruption are easy to miss if you open on a line chart alone.

The dumbbell chart on the left is doing specific work. It shows before-and-after at the country level, ordered from smallest drop to largest, so the global dip and the national collapses sit in the same view. We use white for 2019 and orange for 2021 here — not the vaccine colors — because this section is about disruption, not disease comparison. We simplified the palette after testing showed too many encodings on one page was hurting readability.

The timeline on the right brings it back to polio globally: a dip to about 81% in 2021, partial recovery toward 84% by 2024, still below the 2019 peak. The shaded band spans the full chart height so COVID reads as a time window, not just the area under the curve — you see the disruption period even if you never trace the line itself.

Together, the two charts defend the section title: a modest global dip and a catastrophic national collapse can coexist. Recovery is real but uneven — which closes the loop on everything we've shown. Averages smooth over gaps that are geographic, economic, and country-specific. Sudan and Myanmar are two faces of the same problem from different angles.
