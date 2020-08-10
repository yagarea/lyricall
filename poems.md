---
layout: default
title: Poems
permalink: /poems/
tab: listing
---

<div style="margin-left: 10em">
{% for author in site.authors %}
	<h2>{{ author }}</h2>
	<blockquote>
		{% for post in site.posts | where:"author", author %}
    		<li>
      			<time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
      			<a href="{{ post.url | relative_url }}"><b>{{ post.title }}</b></a>
    		</li>
		{% endfor %}
	</blockquote>
{% endfor %}
</div>
