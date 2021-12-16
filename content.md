---
layout: default
title: Content
permalink: /content/
tab: content
---

{%- capture authors_raw -%}{% for post in site.posts %}{{- post.author -}}{% if forloop.last == false %}^{% endif %}{% endfor %}{%- endcapture -%}
{%- assign authors = authors_raw | split: "^" | uniq | sort_natural -%}

<h2 style="text-align: center;">{{page.title}}</h2>
<div class="post">
	<div class="poem-list">
	{% for author in authors %}
		{% assign current_author = site.posts | where: "author", author %}
		<h2 id="{{ author | replace: " ", "-" }}">{{ author }}</h2>
		<div class="indent">
			{%- for post in current_author -%}
				{%- if post.listed -%}
				<ul class="hfill">
					<li><a href="{{ post.url | relative_url }}"><b>{{ post.title | markdownify | liquify | remove: "<p>" | remove: "</p>" }}</b></a></li>
					<li>{%- if post.audio -%}[A]{%- endif -%}[{{- post.lang | upcase -}}] <time class="hide-on-mobile" atetime="{{- post.date | date_to_xmlschema -}}">{{- post.date  | date: "%d. %m. %Y" -}}</time></li>
				</ul>
				{% endif %}
			{% endfor %}
		</div>
		{% if forloop.last == false %}
			<hr/>
		{% endif %}
	{% endfor %}
	</div>
</div>


<div class="post">
	<div class="poem-list">
		<h2>Statistics</h2>

		{% assign totalWords = 0 %}
		{% assign dateOb = '' %}

		{% for post in site.posts %}
			{% assign postWords = post.content | number_of_words %}
			{% assign totalWords = totalWords | plus:  postWords %}
			{% assign pd = post.date | date: "%Y-%m-%d" %}
			{% unless forloop.first %}
				{% assign dateOb = dateOb | append: "," %}
			{% endunless %}
			{% assign dateOb = dateOb | append: pd %}
		{% endfor %}

		{% assign avgWords = totalWords | divided_by: site.posts.size %}
		
		{% assign hidenPosts = 0 %}
		{% for post in site.posts %}
			{% if post.listed == false %}
				{% assign hidenPosts = hidenPosts | plus: 1 %}
			{% endif %}
		{% endfor %}

		<ul>
			<li>Published posts: {{ site.posts.size | minus: hidenPosts }}</li>
			<li>Hiden posts: {{ hidenPosts }}</li>
			<!--<li>Total tags: {{ site.tags.size }}</li>-->
			<li>Total words: {{ totalWords }}</li>
			<li>Average words per post: {{ avgWords }}</li>
		</ul>
		<!--
		postsPerTag:[
			{% for tag in site.tags %}
				{% assign tagName = tag[0] %}
				{% unless forloop.first %},{% endunless %}
				{ "name": "{{tagName}}", "size":{{site.tags[tagName].size}} }
			{% endfor %}
		],
		-->
	</div>
</div>
