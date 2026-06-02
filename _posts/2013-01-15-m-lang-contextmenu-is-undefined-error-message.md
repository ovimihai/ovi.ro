---
layout: post
title: "Solve: “m.lang.contextmenu is undefined” error message"
date: 2013-01-15
permalink: /issues/m-lang-contextmenu-is-undefined-error-message/
categories: ["Issues", "JavaScript Issues"]
tags: ["CKEditor", "language error", "m.lang.contextmenu"]
---
<p>I got this error while developing a website. It was odd the problema was not already reported, but that was because of the diferent language of the visitors.</p>
<p>The problem seems to be from the CKEditor language detection mechanism, I tried alerted</p>
<pre class="lang:js decode:true">alert(CKEDITOR.lang.detect( 'en' )); // the result was 'en-gb'</pre>
<p>The file in /ckeditor/lang/  was called &#8216;en.js&#8217; so probably they expected the language code to be just &#8216;en&#8217;.</p>
<p>The fast solution was to add this in the CKEDITOR.editorConfig function  (config.js file)</p>
<pre class="lang:js decode:true">if (CKEDITOR.lang.detect( 'en' ) == 'en-gb') {
	config.language = 'en';
}</pre>
<p>There might be a better solution detecting all posibilities &#8216;en-gb&#8217;, &#8216;en-us&#8217; etc. or with some Regexp like</p>
<pre class="lang:default decode:true">if ( /en.*/.test("en-us") ) {
	config.language = 'en';
}</pre>
<p>&nbsp;</p>
