---
layout: post
title: "jQuery Custom Autocomplete with two columns"
date: 2013-01-16
permalink: /issues/jquery-custom-autocomplete-with-two-columns/
categories: ["Issues", "JavaScript Issues"]
tags: ["2", "autocomplete", "two columns"]
---
<p>How to create 2 columns autocomplete.</p>
<p>This is a little bit non w3c compilant, but it works fine:)</p>
<pre class="lang:default decode:true">&lt;style&gt;
.resultBox{ float: left; width: 50%!important;}
&lt;/style&gt;
&lt;input type="text" id="search-box"&gt;</pre>
<p>The ideea is to add two divs inside the results ul and render each result in the proper div</p>
<pre class="lang:default decode:true">$.widget( "custom.twocolumnsautocomplete", $.ui.autocomplete, {
		_renderMenu: function( ul, items ) {
			var that = this,
			currentCategory = "";
			ul.addClass('searchAutocomplete');
			// insert columns for the 2 categories: artists and songs
			ul.append('&lt;div class="cat1 resultBox"&gt;&lt;li&gt;Category1&lt;/li&gt;&lt;/div&gt;');
			ul.append('&lt;div class="cat2 resultBox"&gt;&lt;li&gt;Category2&lt;/li&gt;&lt;/div&gt;');
			$.each( items, function( index, item ) {
				// render li items for each category
				that._renderItem( ul.find('.'+ item.category ), item );
			});
		}
	});

var data = [
  {label: 'AAA', value: 'aaa', category: 'cat1'},
  {label: 'ABB', value: 'abb', category: 'cat2'}
];

$('#search-box').twocolumnsautocomplete({
  source: data
});</pre>
<p>Demo <a href="https://jsfiddle.net/ovi_mihai/Ybjq4/7/">http://jsfiddle.net/ovi_mihai/Ybjq4/7/</a></p>
<p>For ajax data, please make sure the category ends up in your autocomplete return.</p>
<p><strong>[EDIT] It seems there is a problem with the selection of items this doesn&#8217;t work as expected, it only looks good.</strong></p>
