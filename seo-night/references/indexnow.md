# IndexNow

IndexNow tells Bing (and Yandex, Seznam, Naver) the moment a URL changes. Bing also feeds
ChatGPT search and Copilot, so it matters more than its search share suggests.

1. Make a key: 32 hex characters (`openssl rand -hex 16`).
2. Serve it as a public text file at the site root: `/<key>.txt` containing the key. Make sure
   auth middleware skips `.txt`.
3. Add a script that reads the live sitemap and submits every URL:

```js
// scripts/submit-indexnow.mjs — run after each deploy: node scripts/submit-indexnow.mjs
const host = "example.com", key = "<key>";
const xml = await (await fetch(`https://${host}/sitemap.xml`)).text();
const urlList = [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1]);
const res = await fetch("https://api.indexnow.org/indexnow", {
  method: "POST",
  headers: { "Content-Type": "application/json; charset=utf-8" },
  body: JSON.stringify({ host, key, keyLocation: `https://${host}/${key}.txt`, urlList }),
});
console.log(res.status, urlList.length, "URLs submitted");
```
