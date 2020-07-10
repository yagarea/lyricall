---
layout: default
title: Poems
permalink: /poems/
tab: listing
---

<div style="margin-left: 10em">
{% for post in site.posts %}
    <li>
      	<time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
      	<a href="{{ post.url | relative_url }}"><b>{{ post.author }}</b>: {{ post.title }}</a>
    </li>
{% endfor %}
</div>