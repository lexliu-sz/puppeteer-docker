// create a screenshot of example.com in example.png
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch(
    {
        executablePath: '/usr/bin/chromium',
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
 
  const page = await browser.newPage();
  await page.goto('https://qq.com');
  await page.screenshot({ path: 'qq.png' });

  await browser.close();
})();
