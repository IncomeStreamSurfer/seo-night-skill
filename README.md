# SEO Night: a free Claude Code skill

One command that does a full night of SEO on your website's codebase: it audits the site, maps
your keywords, then makes the changes as one git commit per change on a branch, with a baseline
to measure against in 30 days.

It's built from one real night of work on a venue's website. In the 74 days after it:

- Enquiries from Google search: **5 → 43**
- Visits from Google search: **1,074 → 2,491**
- Visits from AI assistants (ChatGPT, Perplexity, Gemini): **16 → 123**
- 10 bookings that started with a search

## What it does

1. **Audit and baseline.** Every public page's title, H1, structured data and crawl health,
   plus what you rank for today.
2. **Keyword map.** Striking-distance keywords, headings with no keyword in them, questions
   people ask, and gaps you can honestly serve. It stops here and asks before writing anything.
3. **The moves, one commit each:**
   - keyword headings
   - guide pages
   - answer-first passages for AI search
   - llms.txt and business facts in JSON-LD
   - internal links and FAQs
   - new landing pages
   - plumbing: sitemap, robots, IndexNow, AI-referral tracking
4. **Verify and hand over.** It builds, checks every changed page, and gives you the short list
   of things only you can do (deploy, Search Console, Wikidata, PR).

It never deploys, never commits to main, never touches checkout or payments, and never invents
facts about your business.

## Install

```bash
git clone https://github.com/IncomeStreamSurfer/seo-night-skill
cp -r seo-night-skill/seo-night ~/.claude/skills/
```

Then, in Claude Code, inside your website's repo:

```
/seo-night
```

## Keyword data: Semrush

The skill uses the **Semrush MCP** for search volumes, keyword difficulty, your current rankings
and your competitors. Connect it in Claude Code (setup guide:
https://www.semrush.com/kb/1619-getting-started-with-mcp).

No Semrush account? Start a 14-day free trial of Semrush One: https://semrush.sjv.io/JkmbYa

It also works from a Google Search Console export if you have one.

## Works with

Next.js (app and pages router), Astro, WordPress themes, Shopify themes and plain HTML sites.

---

Made by [Income Stream Surfers](https://www.youtube.com/@Incomestreamsurfers).
