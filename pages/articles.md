---
layout: document
title: Articles
permalink: /articles/
tab: content
sitemap: false
listed: false
---

{%- capture authors_raw -%}{% for post in site.articles %}{{- post.author -}}{% if forloop.last == false %}^{% endif %}{% endfor %}{%- endcapture -%}
{%- assign authors = authors_raw | split: "^" | uniq -%}

<div class="poem-list">
{% for author in authors %}
	<h2 id="{{ author | replace: " ", "-" }}">{{ author }}</h2>
	<blockquote>
		{% assign current_author = site.articles | where: "author", author %}
		{% for post in current_author %}
			{% if post.listed %}
			<ul class="hfill">
    			<li><a href="{{ post.url | relative_url }}"><b>{{ post.title }}</b></a></li>
				<li>[{{ post.lang | upcase }}] <time class="hide-on-mobile" atetime="{{ post.date | date_to_xmlschema }}">{{ post.date  | date: "%d. %m. %Y" }}</time></li>
			</ul>
			{% endif %}
		{% endfor %}
	</blockquote>
	{% if forloop.last == false %}
		<hr/>
	{% endif %}
{% endfor %}
</div>

