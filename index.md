---
layout: default
title: "Recently published"
---

<div>
{% for post in site.posts %}
	<div id="post-short">
		<a href="{{site.url}}{{site.baseurl}}{{post.url}}">
			<h2>{{post.title}}</h2>
		</a>
		<a href="{{site.url}}{{site.baseurl}}{{post.url}}">
			<h3>{{post.author}}</h3>
		</a>
		<i>posted on {{ post.date | date: "%-d %b %Y" }}</i>
		<p>
			{% if post.excerpt %}
				{{ post.excerpt }}
				<a href="{{site.url}}{{site.baseurl}}{{post.url}}"><i>Read more...</i></a>
			{% else %}
				{{ post.content }}
			{% endif %}
		</p>
	</div>
	<hr/>
{% endfor %}
</div>