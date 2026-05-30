#!/usr/bin/env node
/**
 * Export submission_prototype.html to PDF (full scroll height, dark background).
 * Usage: cd final && node export_submission_pdf.mjs
 */
import puppeteer from 'puppeteer-core';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const htmlPath = path.join(__dirname, 'submission_prototype.html');
const pdfPath = path.join(__dirname, 'submission_prototype.pdf');
const fileUrl = 'file://' + htmlPath.split(path.sep).join('/');

const chromePath =
  process.platform === 'darwin'
    ? '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
    : process.platform === 'win32'
      ? 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'
      : '/usr/bin/google-chrome';

const browser = await puppeteer.launch({
  executablePath: chromePath,
  headless: true,
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});

try {
  const page = await browser.newPage();
  await page.setViewport({ width: 1200, height: 900, deviceScaleFactor: 2 });

  await page.goto(fileUrl, { waitUntil: 'networkidle0', timeout: 90000 });

  await page.waitForSelector('#chart1 svg path', { timeout: 15000 });
  await page.waitForSelector('#chart3 circle.dot', { timeout: 15000 });
  await page.waitForSelector('#chart2 svg path.country', { timeout: 45000 }).catch(() => {
    console.warn('Map may not have loaded (offline/CDN); continuing anyway.');
  });

  await new Promise((r) => setTimeout(r, 1500));

  const dimensions = await page.evaluate(() => ({
    width: Math.max(document.documentElement.scrollWidth, 1200),
    height: document.documentElement.scrollHeight,
  }));

  await page.pdf({
    path: pdfPath,
    printBackground: true,
    width: `${dimensions.width}px`,
    height: `${dimensions.height}px`,
    margin: { top: '0', right: '0', bottom: '0', left: '0' },
    preferCSSPageSize: false,
  });

  console.log('Wrote', pdfPath);
} finally {
  await browser.close();
}
