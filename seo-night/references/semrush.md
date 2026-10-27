# Semrush MCP: the calls that matter

The Semrush MCP works in three steps: a discovery tool lists reports, `get_report_schema(report)`
gives its parameters, `execute_report(report, params)` returns data. Always set `database` to the
site's country (`uk`, `us`, `ie`, `de`…); the default is `us`.

| Question | Discovery tool | Report | Key params |
|---|---|---|---|
| Is the site growing? | domain_overview | `resource_rank_history` | target, database, export_columns incl. organic_keywords, organic_traffic, serp_ai_overview_positions |
| What does it rank for now? | organic_research | `resource_organic` | target, database, display_sort traffic_desc, display_limit 30–50 |
| Striking distance | organic_research | `resource_organic` | display_filter position greater_than 7 and less_than 31 |
| Volume + difficulty for my list | keyword_research | `phrase_these` | phrase "a;b;c" (semicolons), export_columns keyword, volume, keyword_difficulty, intent |
| Related keywords | keyword_research | `phrase_related` | phrase, database |
| Questions people ask | keyword_research | `phrase_questions` | phrase, database |
| Who competes | competitors_research | (see its list) | target, database |
| Who ranks for a keyword | keyword_research | `phrase_organic` | phrase, database |

Rules of thumb:
- Difficulty under ~30 with any real volume on a page that fits: do it.
- Brand searches (the business's own name) inflate traffic estimates. Report non-brand separately.
- Semrush traffic is an estimate. Search Console clicks and the site's own analytics are the truth;
  use Semrush for keywords and positions, not for the headline result.
