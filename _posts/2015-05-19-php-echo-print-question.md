---
layout: post
title: "PHP echo print question"
date: 2015-05-19
permalink: /php/sadness/php-echo-print-question/
categories: ["Sadness"]
tags: []
---
<p>Working with echo or print is very easy in PHP.<br>
At the begining it might be harder to understand concatenations or operations order, but after you master them is really easy.<br>
But there are some cases where you wonder how does this work ?!?!</p>
<h2>What does this print?</h2>
<pre class="lang:php decode:true">echo 1 . print(2+3) . 1+2;</pre>
<p>Don&#8217;t rush to conclusions to fast.. Make sure you remember what echo and print do and what is the order of operations.</p>
<p>Hint 1: print also returns after the opration is done<br>
Hint 2: echo and print are language constructs, not functions.</p>
<h2 style="cursor: pointer;" onclick="document.getElementById('echoPrintSolution').style.display = 'block'">Click here to see the solution</h2>
<div id="echoPrintSolution" style="display: none;">
<p>You might not know that print will be executed first, but if you do, that is not enough.<br>
So, the order of operations is:<br>
1. evaluate <span style="color: #ff0000;">2+3</span> = 5<br>
2. evaluate <span style="color: #ff0000;">1+2</span> = 3<br>
3. evaluate print arguments: <span style="color: #ff0000;">5 . 3</span> = 53 &#8211; don&#8217;t forget, print is not a function, is a language construct as echo!<br>
4. will actually print <span style="color: #ff0000;">53</span> and return true<br>
5. evaluate echo arguments: concatenation between <span style="color: #ff0000;">1</span> and <span style="color: #ff0000;">true</span> = 11<br>
6. echoes <span style="color: #ff0000;">11</span></p>
<p>So the result is: <span style="color: #ff0000;">5311</span>
</p>
</div>
