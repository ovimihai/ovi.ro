# ovi.ro

Personal blog built with [Jekyll](https://jekyllrb.com/) and hosted on GitHub Pages
(custom domain in [`CNAME`](CNAME)). Converted from a WordPress export while keeping
the original "OmaGue" theme look.

## Run locally

```bash
bundle install                  # first time only
bundle exec jekyll serve        # http://127.0.0.1:4000  (add --livereload to auto-refresh)
```

## Structure

```
_config.yml        Site config, pagination, category → URL map
_layouts/          default, home, post, page, archive
_includes/         head, header (nav), sidebar, footer
_posts/            Blog posts (Markdown + front matter)
about.md           About page
index.html         Paginated homepage
category/, tag/    Archive page stubs (one per category/tag)
assets/            css/, fonts/, img/
```

## Writing a post

Add a file to `_posts/` named `YYYY-MM-DD-title.md`:

```yaml
---
layout: post
title: "My new post"
date: 2026-06-02
permalink: /section/my-new-post/
categories: ["PHP"]
tags: ["example"]
---

Post content here. Markdown and inline HTML both work.
```

`categories` must match a key in `category_links` in [`_config.yml`](_config.yml) so the
category links and breadcrumb resolve. Recent Posts, the homepage list, and the feed
update automatically.

## Deploy

Push to the default branch — GitHub Pages builds and publishes automatically.
