# Where SEO lives, by stack

| Stack | Titles / meta | H1s | JSON-LD | Sitemap / robots | llms.txt |
|---|---|---|---|---|---|
| Next.js app router | `export const metadata` / `generateMetadata` in `page.tsx`, template in root `layout.tsx` | the page component | a `<script type="application/ld+json">` component | `app/sitemap.ts`, `app/robots.ts` | `app/llms.txt/route.ts` or `public/llms.txt` |
| Next.js pages router | `next/head` or `next-seo` | page component | in `<Head>` | `public/` or `next-sitemap` | `public/llms.txt` |
| Astro | layout `<head>` props | `.astro` page | layout or component | `@astrojs/sitemap`, `public/robots.txt` | `public/llms.txt` |
| WordPress | Yoast / Rank Math fields, or theme `header.php` | theme templates or block content | the SEO plugin, or `wp_head` hook | the SEO plugin | `public_html/llms.txt` |
| Shopify | `theme.liquid` + `seo` fields on products/pages | section/template Liquid | `theme.liquid` or snippets | automatic; robots via `robots.txt.liquid` | app or a page redirect |
| Static HTML | each file's `<head>` | each file | inline `<script>` | files at the root | file at the root |

Check for:
- Content in a CMS (Sanity, Contentful, a DB-backed page builder, seed files). Change the seeds
  or defaults in the repo; tell the user anything that has to be changed in the CMS itself.
- Middleware or auth that blocks `/llms.txt`, `/robots.txt`, `/sitemap.xml` or the IndexNow key.
- Hosting headers that add `X-Robots-Tag: noindex` (Vercel preview hosts are fine to noindex;
  the production host must not be).
