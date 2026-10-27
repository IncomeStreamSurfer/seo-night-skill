# SEO Night 🌙

**A free Claude Code / OpenCode skill that fixes AI-slop SEO on your website, in one command.**

AI-built websites look great and rank for nothing. Their headings are poetry ("Sauna, and the
North Sea.") instead of what people search for ("Wild sauna on the beach"). SEO Night audits your
site's codebase, finds what's missing, and fixes it as one git commit per change on a branch you
review.

```bash
curl -fsSL https://raw.githubusercontent.com/IncomeStreamSurfer/seo-night-skill/main/install.sh | bash
```

Then open your website's repo and run `/seo-night`.

> 🎯 **The skill gets its keyword data from Semrush.** No account? **[Start a 14-day free trial of Semrush One →](https://semrush.sjv.io/JkmbYa)**

---

## Results

### Ballinderry Park: the night this skill is built from

A wedding and events venue in Galway, Ireland. One night of SEO work with Claude Code on 21 May
2026 (31 commits). Real numbers from the site's analytics, comparing the 74 days before with the
74 days after:

| | Before | After | |
|---|---|---|---|
| Enquiries from Google search | 5 | **43** | 8.6× |
| Visits from Google search | 1,074 | **2,491** | 2.3× |
| Visits from AI assistants (ChatGPT, Perplexity, Gemini) | 16 | **123** | 7.7× |
| Keywords ranking in Google | 24 | **73** | |
| Bookings that started with a search | | **10** | |

The single biggest change was a heading. The hen party page's H1 went from "Hen Parties" to
"Hen Party Venue in Galway". That page alone went on to 322 visits from Google, 11 enquiries and
4 bookings.

### ROE Wild Saunas: the first site the skill ran on

A beach sauna at North Landing, Flamborough (UK), built with AI. It already looked great, but
ranked for **zero** keywords in Google. SEO Night ran on 27 October 2026: 16 commits, the build
passing.

**What it found**

| Move | Before | What the skill did |
|---|---|---|
| 1. Keyword headings | ⚠️ Partial: titles fine, every H1 a slogan | New keyword H1s and H2s on 7 pages, slogans kept |
| 2. Guide pages | ✅ Done | Skipped |
| 3. Answer-first passages | ⚠️ Partial | 50-word answers under the new H2s on 5 pages |
| 4. Citable by AI | ✅ Mostly done | Cleaned `sameAs`, phone in international format, capacity in llms.txt |
| 5. Internal links + FAQs | ✅ Done | Skipped |
| 6. Landing pages | — | None: a page per nearby town would be a doorway page |
| 7. Plumbing | ❌ No IndexNow | IndexNow key + `npm run indexnow` |

**AI slop → SEO**

| Page | Before (H1) | After (H1) | Keyword (UK searches/mo) |
|---|---|---|---|
| Home | Sauna, and the North Sea. | Wild sauna on the beach, North Landing. | wild sauna (1,900), beach sauna (720) |
| Visit | Where the road runs out of land. | Visiting North Landing, Flamborough. | north landing flamborough (1,000) |
| Things to do | Chalk, caves and a sky full of wings. | Things to do in Flamborough. | things to do in flamborough (480) |
| Cold water | Fire, then the North Sea, then stillness. | Sauna and cold plunge, in the North Sea. | sauna and cold plunge (1,000) |
| Private hire | The whole sauna, just yours. | Private sauna hire at North Landing. | private sauna (390) |
| Gift vouchers | Give someone the North Sea. | Sauna gift vouchers for North Landing. | sauna gift vouchers |
| History | The lifeboats of North Landing. | Flamborough lifeboat station, North Landing. | flamborough lifeboat station |

Every slogan was kept, as the first line of the intro. Rankings get re-measured on 26 November
2026; results will be added here.

---

## What it does

1. **Audit and baseline.** Every public page's title, H1, structured data and crawl health,
   plus what you rank for today, saved to `seo-night/baseline.md` so you can measure in 30 days.
2. **Scorecard.** It scores your site against the seven moves and does only what's missing.
3. **Keyword map.** Striking-distance keywords, headings with no keyword in them, questions
   people ask, and gaps you can honestly serve.
4. **The seven moves, one commit each:**
   - keyword headings
   - guide pages
   - answer-first passages for AI search
   - llms.txt and business facts in JSON-LD
   - internal links and FAQs
   - landing pages
   - plumbing: sitemap, robots, IndexNow, AI-referral tracking
5. **Verify and hand over.** It builds, checks every changed page, flags anything your CMS
   overrides, and gives you the short list only you can do (deploy, Search Console, Wikidata, PR).

**It's safe:**
- It works on a branch and never deploys.
- It never touches checkout, payments or auth.
- It never invents facts about your business.

## Install

### One line, for Claude Code and OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/IncomeStreamSurfer/seo-night-skill/main/install.sh | bash
```

This installs the skill to `~/.claude/skills/seo-night`, which both Claude Code and OpenCode
read. If you have OpenCode, it also installs a `/seo-night` command for it.

### Or by hand

```bash
git clone https://github.com/IncomeStreamSurfer/seo-night-skill
cp -R seo-night-skill/seo-night ~/.claude/skills/
# OpenCode only, for the /seo-night command:
mkdir -p ~/.config/opencode/commands && cp seo-night-skill/opencode/seo-night.md ~/.config/opencode/commands/
```

## Run it

Open your website's repo and type:

| | |
|---|---|
| **Claude Code** | `/seo-night` |
| **OpenCode** | `/seo-night`, or just say "run the seo-night skill" |

Want to see the plan before it changes anything? Run `/seo-night plan only`.

When it's done, review the branch (`git log main..`), then merge and deploy as you normally do.

## Keyword data: Semrush

SEO Night uses the **Semrush MCP** for search volumes, keyword difficulty, your current rankings
and competitors. Connect it to Claude Code or OpenCode:
https://www.semrush.com/kb/1619-getting-started-with-mcp

No Semrush account? **[Start a 14-day free trial of Semrush One](https://semrush.sjv.io/JkmbYa)**

It also works from a Google Search Console export (Performance → Queries and Pages).

## Works with

Next.js (app and pages router), Astro, WordPress themes, Shopify themes and plain HTML sites.

---

Made by [Income Stream Surfers](https://www.youtube.com/@Incomestreamsurfers).
