---
layout: default
title: Content
permalink: /content/
tab: content
---

{%- capture authors_raw -%}{% for post in site.posts %}{{- post.author -}}{% if forloop.last == false %}^{% endif %}{% endfor %}{% endcapture %}
{%- assign authors = authors_raw | split: "^" | uniq -%}

<div id="post">
<div class="poem-list">
{% for author in authors %}
	<h2 id="{{ author | replace: " ", "-" }}">{{ author }}</h2>
	<blockquote>
		{% assign current_author = site.posts | where: "author", author %}
		{% for post in current_author %}
			{% if post.listed %}
			<ul class="hfill">
    			<li><a href="{{ post.url | relative_url }}"><b>{{ post.title }}</b></a></li>
				<li>[{{ post.lang | upcase }}] <time class="hide-on-mobile" atetime="{{ post.date | date_to_xmlschema }}">{{ post.date  | date: "%d. %m. %Y" }}</time></li>
			</ul>
			{% endif %}
		{% endfor %}
		<hr/>
	</blockquote>
{% endfor %}
</div>
</div>

