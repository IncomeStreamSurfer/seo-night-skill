---
name: seo-night
description: Use when someone wants to improve a website's SEO, rank higher on Google, get cited by ChatGPT / AI Overviews / Perplexity (GEO, AEO), or says "do my SEO", "seo night", "/seo-night", "why don't we rank", "get more enquiries from Google". Audits the site and its keywords, then makes the changes in the codebase as one commit per change on a branch, with a baseline to measure against in 30 days.
---

# SEO Night

One sitting of real SEO work on a real codebase, done as commits. Every move here came from one
night on a venue website (21 May 2026, 31 commits) that took enquiries from Google search from
5 to 43 in the 74 days after, with 10 bookings starting from a search.

The moves are boring on purpose. Most sites don't need more content; they need their money pages
to say what people search for, answers that AI search can lift, and plumbing that doesn't hide
them.

## Rules (read first, never break)

1. **Work on a branch.** `git switch -c seo-night/<yyyy-mm-dd>`. Never commit to main, never
   deploy, never push unless the user says so. A dirty working tree: stop and ask.
2. **One commit per change.** The message says what changed and why, with the keyword and its
   volume where there is one: `Retarget the glamping page for "glamping ireland" (1,900/mo, KD 11)`.
   The commit log is the deliverable; it should read like a report.
3. **Never invent facts.** Prices, capacity, opening times, addresses, distances, awards, years:
   take them from the codebase, its CMS seeds or the live site, or ask. A wrong fact in JSON-LD
   or llms.txt is worse than none, because AI search repeats it.
4. **One page per keyword.** Before targeting a keyword, check no other page already targets it.
   Two pages on one keyword split the ranking (cannibalisation).
5. **Keep the brand voice.** Slogans become the sub-headline, never deleted. The keyword goes in
   the H1 once, naturally. No stuffing, no keyword lists in footers, no hidden text.
6. **Don't touch booking, checkout, auth or payments code.** SEO lives in content, metadata,
   structured data, routing for public pages, and crawl files.
7. **Stop at the checkpoint** (step 3) and get a yes before writing pages.

## Step 1: Preflight

- Find the stack and where SEO lives: titles/meta, H1s, JSON-LD, sitemap, robots, llms.txt,
  redirects, middleware. See `references/stacks.md` for where each lives in Next.js (app and
  pages router), Astro, WordPress, Shopify and static sites.
- Find the business facts: an existing `site.ts`/config, CMS seeds, the homepage, the footer.
- Find the domain, its country, and the canonical host (www or not).
- Pick the data source for keywords:
  - **Semrush MCP** (tools with `semrush` in the name): use it. It gives search volume,
    difficulty, the site's current positions and competitors. See `references/semrush.md`.
  - **No Semrush MCP detected: try Jina.** If `JINA_API_KEY` is set, use Jina's search API to
    see who ranks for each query (`references/jina.md`). Jina has no search volumes, so rank
    keywords by Search Console impressions if the user can export them, otherwise by business
    value, and say the volumes are unknown.
  - **Neither:** ask for a Search Console export (Performance → Queries and Pages, last 3 months)
    and work from that.

## Step 2: Audit and baseline

Write `seo-night/baseline.md` in the repo (commit it first, on the branch). It is what makes the
30-day comparison possible:

- Date, domain, data source used.
- Every public page: URL, current `<title>`, H1, meta description, whether it has JSON-LD, FAQ,
  and an answer-first passage.
- The keywords the site ranks for now (top 30 by traffic), with position and volume.
- The money pages (where a visitor can book, buy or enquire) and their position for their best
  keyword.
- Crawl health: robots.txt and sitemap reachable and complete, llms.txt reachable (not behind
  auth or middleware), no `noindex` on public pages (check headers, `vercel.json`, meta tags),
  canonical host consistent, trailing-slash duplicates.
- Analytics present? (PostHog, GA4, Plausible) and whether AI-assistant referrals are tracked.

Then score the site against the moves in step 4 and put the scorecard at the top of the
baseline. Sites often have some SEO done already; this is how you pick up only what's missing:

| Move | Status | Evidence |
|---|---|---|
| 1 Keyword headings | done / partial / missing | e.g. titles carry keywords, but every H1 is a slogan |
| 2 Guide pages | … | … |
| 3 Answer-first passages | … | … |
| 4 Citable by AI (llms.txt, JSON-LD, sameAs) | … | … |
| 5 Internal links + FAQs | … | … |
| 6 Landing pages from keyword data | … | … |
| 7 Plumbing (sitemap, robots, noindex, IndexNow, AI tracking) | … | … |

Judge "done" by what the live pages serve (fetch them), not by what the code seems to intend.
A title with the keyword and an H1 that is a slogan is "partial".

## Step 3: The keyword map, then the checkpoint

For each money page: one primary keyword and two to four secondaries, with volume and difficulty.
Look for:

- **Striking distance:** keywords where the site sits at position 8–30. Cheapest wins.
- **Headings with no keyword:** H1s like "Your day, your way" or "Hen Parties" on a page that
  should rank for "Wedding Venue in Galway" / "Hen Party Venue in Galway".
- **Questions** people ask around each service (Semrush questions report, People Also Ask via
  Jina, or the site's own enquiry emails). These become guide pages and FAQs.
- **Gaps:** keywords competitors rank for that the business can honestly serve. A gap with no
  product fit is not a gap.
- **Location variants:** town, county, region, country ("Galway" and "Ireland").

Show the map as a table and the planned commits as a numbered list. **Wait for a yes.** The user
knows their business; they will cross out things you can't know are wrong (a service they no
longer offer, a keyword that attracts the wrong customers).

## Step 4: The moves (one commit each)

Do them in this order. Skip a move the audit showed is already done well, and say so.

1. **Keyword headings.** Title, H1, H2s and meta description on each money page carry its
   keyword. Brand name once in the title (check the layout template doesn't double it).
2. **Guide pages for "how do I plan…" searches.** One guide per informational cluster, separate
   from the booking page: real local detail, sample itineraries, costs, an FAQ, Article +
   FAQPage JSON-LD, and a clear link to the booking page. The booking page links back.
3. **Answer-first passages.** Under every keyword H2, a standalone ~50-word answer to that
   heading's question. AI Mode, ChatGPT and Perplexity split a question into sub-questions and
   lift one passage per section; give them one worth lifting.
4. **Make the site citable by AI.**
   - llms.txt: a short "Key facts" block (what, where, who for, capacity, prices, how to book)
     plus a map of which page holds what. Publicly reachable, outside any auth middleware.
   - JSON-LD for the business: the right type (LocalBusiness subtype, Organization, Product),
     quotable hard facts as properties, correct geo coordinates (check them), phone in E.164.
   - `sameAs`: only real, live profile URLs (Google Business, Wikidata, directories, socials).
     Never a broken or draft URL.
5. **Internal links and FAQs.** Guides ↔ booking pages both ways, a Guides group in the footer,
   FAQ sections with FAQPage schema on the money pages.
6. **New landing pages from the keyword map.** Only where volume, difficulty and product fit all
   say yes. Each with its own keyword, answer-first intro, FAQ and schema, wired into the
   sitemap and footer.
7. **Plumbing.** Every public page in the sitemap; robots.txt served statically; no stray
   noindex; one canonical host; IndexNow key file plus a submit script that reads the sitemap
   (`references/indexnow.md`); AI-referral tracking if analytics exists (tag the session with
   the AI source from the referrer: chatgpt.com, perplexity.ai, gemini.google.com,
   copilot.microsoft.com, claude.ai).

## Step 5: Verify

- The project builds (`npm run build` or the stack's equivalent) and lints clean.
- Run it locally and fetch each changed page: one H1, the title and meta you meant, JSON-LD that
  parses (`JSON.parse` each `application/ld+json` block), FAQ markup matching the visible FAQ.
- `/robots.txt`, `/sitemap.xml` and `/llms.txt` return 200 and list what they should.
- `git log --oneline main..` reads as a clear report.

## Step 6: Hand over

Tell the user, briefly:
- What changed: the commit list, grouped by move.
- What only they can do, as a checklist:
  - Merge and deploy.
  - Submit the sitemap in Google Search Console and Bing Webmaster Tools.
  - Run the IndexNow script after deploy.
  - Create a Wikidata entry for the business and add its URL to `sameAs`.
  - Keep the Google Business Profile complete.
  - Get mentioned on local news and directory sites (PR is what AI search trusts most).
- The date to re-measure, 30 days out, against `seo-night/baseline.md`: positions, clicks,
  enquiries, AI referrals.
