---
layout: post
title: "Foreach with reference"
date: 2015-05-28
permalink: /php/sadness/foreach-with-reference/
categories: ["Sadness"]
tags: []
---
<p>If you iterate over an array with &#038; you should unset the value variable after to not modify the array accidentally after.</p>
<pre class="lang:php decode:true">$array = array('a', 'b', 'c', 'd');

foreach($array as $key=>&$value) {
    if ($key = 3) {
        // change d to x
        $value = 'x';
    }
}
// this will affect the $array to
$value = 'z';
// $array = array('a', 'b', 'c', 'z');
</pre>
<p>Should do like this</p>
<pre class="lang:php decode:true">$array = array('a', 'b', 'c', 'd');

foreach($array as $key=>&$value) {
    if ($key = 3) {
        // change d to x
        $value = 'x';
    }
}
unset($value);
$value = 'z';  // if you do this accidentally you get a notice but no effect on the array
// $array = array('a', 'b', 'c', 'x');
</pre>
