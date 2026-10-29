# Semrush MCP: the calls that matter, on a credit budget

The Semrush MCP works in three steps: a discovery tool lists reports, `get_report_schema(report)`
gives its parameters, `execute_report(report, params)` returns data. Always set `database` to the
site's country (`uk`, `us`, `ie`, `de`…); the default is `us`.

## Spend as few API units as possible

Every `execute_report` costs API units, mostly **per row returned**. The response's
`metadata.usage.api_units` says what each call cost. Discovery and `get_report_schema` calls are free.
What real runs cost:

| Report | Cost seen | Notes |
|---|---|---|
| `domain_rank` (one row) | ~10 | The cheap first check |
| `resource_rank_history` | ~10 per month | 12 months ≈ 120 |
| `resource_organic` | ~10 per keyword row | 25 rows ≈ 270 |
| `phrase_these` | ~10 per keyword | 20 keywords with difficulty ≈ 220 |
| `list_projects` | ~100 | Skip: you don't need it |

**The budget: aim for 1,000 units or less per site, and never go over 2,000 without asking.**
Keep a running tally (sum `api_units` from each response) and write the total into
`seo-night/baseline.md`.

The rules:

1. **Cache everything.** Save every response to `seo-night/semrush-cache/<report>-<short-hash>.json`
   before using it. Before any call, look for a cached result with the same report and params,
   and reuse it. A re-run of the skill on the same site should cost almost nothing.
2. **Check cheaply first.** One `domain_rank` call (one row). If the site has **0 or only a few
   keywords**, skip `resource_organic` and `resource_rank_history` entirely: there's nothing to
   page through, and those rows are where the cost goes.
3. **Ask for fewer rows.** `display_limit` 20 is plenty, sorted `traffic_desc`. For striking
   distance, filter on the server (`display_filter` position 8–30) instead of pulling 100 rows to
   filter yourself. Request only the `export_columns` you'll use.
4. **One batch of keywords.** Collect every candidate first, from free sources, then send them in a
   single `phrase_these` call (25 at most). Never look keywords up one at a time with `phrase_this`.
5. **Free sources before paid ones.** These cost nothing, so use them to find candidates, and use
   Semrush only to put numbers on the shortlist:
   - the site's own pages, services and headings
   - the Search Console export, if the user has one
   - search autocomplete: `https://suggestqueries.google.com/complete/search?client=firefox&q=<q>`
   - "People also ask" questions from a Jina search, if available

   Use `phrase_questions` and `phrase_related` only if those come up short, with `display_limit` 10.
6. **No competitor deep dives.** At most one competitors call with `display_limit` 5, and only when
   the site already ranks for something. Skip backlinks reports: SEO Night doesn't act on them.
7. **History only when it matters.** `resource_rank_history` with `display_limit` 12, only when the
   site has rankings and the user wants a before/after.
8. **Never call Semrush during verify or hand-over.** Those steps work from the cache and the code.

## The reports

| Question | Discovery tool | Report | Key params |
|---|---|---|---|
| Does it rank at all? (do this first) | domain_overview | `domain_rank` | target, database |
| What does it rank for now? | organic_research | `resource_organic` | target, database, display_sort traffic_desc, display_limit 20 |
| Striking distance | organic_research | `resource_organic` | display_filter position greater_than 7 and less_than 31, display_limit 20 |
| Volume + difficulty for the shortlist | keyword_research | `phrase_these` | phrase "a;b;c" (semicolons), export_columns keyword, volume, keyword_difficulty, intent |
| Is the site growing? | domain_overview | `resource_rank_history` | display_limit 12, export_columns organic_keywords, organic_traffic |
| Questions (only if free sources come up short) | keyword_research | `phrase_questions` | phrase, database, display_limit 10 |

Rules of thumb:
- Difficulty under ~30 with any real volume on a page that fits: do it.
- Brand searches (the business's own name) inflate traffic estimates. Report non-brand separately.
- Semrush traffic is an estimate. Search Console clicks and the site's own analytics are the truth;
  use Semrush for keywords and positions, not for the headline result.
