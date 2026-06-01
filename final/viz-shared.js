/**
 * Shared helpers for submission_prototype.html
 */
(function () {
  const reduceMotionQuery = typeof window.matchMedia === 'function'
    ? window.matchMedia('(prefers-reduced-motion: reduce)')
    : { matches: false, addEventListener() {} };

  function prefersReducedMotion() {
    return reduceMotionQuery.matches;
  }

  function getPolioCovidMetrics(worldData, countryCovidDrop) {
    const w19 = worldData.find(d => d.year === 2019)?.Polio ?? null;
    const w21 = worldData.find(d => d.year === 2021)?.Polio ?? null;
    const w24 = worldData.find(d => d.year === 2024)?.Polio ?? null;
    const globalDrop = (w19 != null && w21 != null) ? Math.round(w19 - w21) : null;
    const belowPeak = (w19 != null && w24 != null) ? Math.round(w19 - w24) : null;
    const nSevere = countryCovidDrop.filter(d => d.drop >= 10).length;
    const myanmar = countryCovidDrop.find(d => d.entity === 'Myanmar');
    const sudanCovid = countryCovidDrop.find(d => d.entity === 'Sudan');
    const maxDrop = countryCovidDrop.reduce(
      (best, d) => (!best || d.drop > best.drop ? d : best),
      null
    );
    return { w19, w21, w24, globalDrop, belowPeak, nSevere, myanmar, sudanCovid, maxDrop };
  }

  function animDur(ms) {
    return prefersReducedMotion() ? 0 : ms;
  }

  function setNarrative(el, html, instant) {
    if (!el) return;
    const fade = animDur(350);
    if (instant || fade === 0) {
      el.innerHTML = html;
      el.style.opacity = '1';
      return;
    }
    el.style.opacity = '0';
    setTimeout(() => {
      el.innerHTML = html;
      el.style.opacity = '1';
    }, fade);
  }

  reduceMotionQuery.addEventListener('change', () => {
    document.documentElement.classList.toggle('reduce-motion', prefersReducedMotion());
  });
  document.documentElement.classList.toggle('reduce-motion', prefersReducedMotion());

  window.VizShared = {
    prefersReducedMotion,
    getPolioCovidMetrics,
    animDur,
    setNarrative,
  };
})();
