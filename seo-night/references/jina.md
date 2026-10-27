# Jina search, when there is no Semrush MCP

Jina's search API returns the live results for a query. Use it to see who ranks, what the top
pages cover, and what questions appear. It has **no search volumes or difficulty**.

```bash
curl -s "https://s.jina.ai/?q=$(python3 -c 'import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))' "sauna flamborough")&gl=uk" \
  -H "Authorization: Bearer $JINA_API_KEY" \
  -H "Accept: application/json" \
  -H "X-Respond-With: no-content"
```

- `gl` sets the country. Drop `X-Respond-With: no-content` to get each result's page content
  as text, which shows what the ranking pages cover (headings, FAQs, length).
- Find the site's own position by looking for its domain in the results. Positions shift by
  location and personalisation; treat them as a rough read.
- Never put the key in a file. Read it from the environment.

Without volumes, prioritise by: Search Console impressions (ask for an export), then how close
the keyword is to what the business sells, then how many competitors rank with weak pages.
Say in the keyword map that volumes are unknown.
