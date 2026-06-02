---
layout: post
title: "Strings array access issue"
date: 2015-05-28
permalink: /php/sadness/strings-array-access-issue/
categories: ["Sadness"]
tags: []
---
<p>What would you expect for this script to output?</p>
<pre class="lang:php decode:true">error_reporting(E_ALL); ini_set('display_errors',1);

$text = "abc";

var_dump(isset($text['key']));
var_dump((bool) $text['key']);
</pre>
<p>Maybe a notice? maybe some false there..<br>
But if you have in mind PHP logic.. you surely know..</p>
<p>So, $text is a string and string characters can be accessed with $text[1] this is &#8220;b&#8221;<br>
Then if you try $text[&#8216;key&#8217;] PHP will typecast your &#8216;key&#8217; to an integer (0) then $text[0] exists!</p>
<p>The second step is simple.. $text[0] is &#8220;a&#8221; and PHP logic again &#8211; any non empty string is true!</p>
<p>Output is:</p>
<pre class="lang:php decode:true">bool(true);
bool(true);
</pre>
