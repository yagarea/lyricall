---
layout: default
title: "Recently published"
tab: home
---

<div>
{% for post in site.posts %}
	{% if post.listed %}
		<div id="post-short">
			<a href="{{site.url}}{{site.baseurl}}{{post.url}}">
				<h2>{{post.title}}</h2>
			</a>
			<a href="{{site.url}}{{site.baseurl}}/poems/#{{ post.author | replace: " ", "-" }}">
				<h3>{{post.author}}</h3>
			</a>
			<i>posted on {{ post.date | date: "%-d %b %Y" }}</i>
			<p>
				{% if post.excerpt %}
					<blockquote>
						{{ post.excerpt }}
					</blockquote>
					<a href="{{site.url}}{{site.baseurl}}{{post.url}}"><i>Read more...</i></a>
				{% else %}
					<blockquote>
						{{ post.content }}
					</blockquote>
				{% endif %}
			</p>
		</div>
	{% endif %}
{% endfor %}
</div>
