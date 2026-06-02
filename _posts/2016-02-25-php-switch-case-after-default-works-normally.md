---
layout: post
title: "PHP switch case after default works normally"
date: 2016-02-25
permalink: /php/zce-training/php-basics/php-switch-case-after-default-works-normally/
categories: ["PHP Basics"]
tags: []
---
<p>When you put the a case block after the default block the switch will work normally and fallback to the default only after testing all cases.<br>
The documentation doesn&#8217;t specify this directly, but there is a note with an example.<br>
Another thing worth mentioning is that switch does loose comparisons, so be careful about 0, false values</p>
<pre class="lang:php decode:true">$a = 3;
switch ($a) {
    case 1: echo 'one'; break;
    case 2: echo 'two'; break;
    default: echo 'four'; break;
    case 3: echo 'three'; break;
}
// outputs 'three'
</pre>
<p><a href="http://ideone.com/DQGUvU" target="_blank" rel="noopener noreferrer">Test yourself on iodine.com</a></p>
