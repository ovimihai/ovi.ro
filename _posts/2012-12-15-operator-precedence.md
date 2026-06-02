---
layout: post
title: "Operator Precedence"
date: 2012-12-15
permalink: /php/zce-training/php-basics/operators/operator-precedence/
categories: ["Operators"]
tags: ["operators", "order", "precedence"]
---
<p>Like in math: 3 + 4 * 5 = 23 and not 35, in PHP you have an order for interpreting the code.</p>
<table class="with-borders" width="780" border="0" cellspacing="0" cellpadding="0">
<colgroup>
<col>
<col>
<col width="248"> </colgroup>
<tbody>
<tr>
<th>Associativity</th>
<th>Operators</th>
<th width="248">Additional Information</th>
</tr>
<tr>
<td>non-associative</td>
<td>clone new</td>
<td width="248">clone<span> and </span><span>new</span>
</td>
</tr>
<tr>
<td>left</td>
<td>[</td>
<td width="248"><a href="https://php.net/manual/ro/function.array.php">array()</a></td>
</tr>
<tr>
<td>right</td>
<td>++ &#8212; ~ (int) (float) (string) (array) (object) (bool) @</td>
<td width="248">types<span> and </span><span>increment/decrement</span>
</td>
</tr>
<tr>
<td>non-associative</td>
<td>instanceof</td>
<td width="248"><a href="https://php.net/manual/ro/language.types.php">types</a></td>
</tr>
<tr>
<td>right</td>
<td>!</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.logical.php">logical</a></td>
</tr>
<tr>
<td>left</td>
<td>* / %</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.arithmetic.php">arithmetic</a></td>
</tr>
<tr>
<td>left</td>
<td>+ &#8211; .</td>
<td width="248">arithmetic<span> ?i </span><span>string</span>
</td>
</tr>
<tr>
<td>left</td>
<td>&lt;&lt; &gt;&gt;</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.bitwise.php">bitwise</a></td>
</tr>
<tr>
<td>non-associative</td>
<td>&lt; &lt;= &gt; &gt;=</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.comparison.php">comparison</a></td>
</tr>
<tr>
<td>non-associative</td>
<td>== != === !== &lt;&gt;</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.comparison.php">comparison</a></td>
</tr>
<tr>
<td>left</td>
<td>&amp;</td>
<td width="248">bitwise<span> ?i </span><span>references</span>
</td>
</tr>
<tr>
<td>left</td>
<td>^</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.bitwise.php">bitwise</a></td>
</tr>
<tr>
<td>left</td>
<td>|</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.bitwise.php">bitwise</a></td>
</tr>
<tr>
<td>left</td>
<td>&amp;&amp;</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.logical.php">logical</a></td>
</tr>
<tr>
<td>left</td>
<td>||</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.logical.php">logical</a></td>
</tr>
<tr>
<td>left</td>
<td>? :</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.comparison.php#language.operators.comparison.ternary">ternary</a></td>
</tr>
<tr>
<td>right</td>
<td>= += -= *= /= .= %= &amp;= |= ^= &lt;&lt;= &gt;&gt;= =&gt;</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.assignment.php">assignment</a></td>
</tr>
<tr>
<td>left</td>
<td>and</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.logical.php">logical</a></td>
</tr>
<tr>
<td>left</td>
<td>xor</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.logical.php">logical</a></td>
</tr>
<tr>
<td>left</td>
<td>or</td>
<td width="248"><a href="https://php.net/manual/ro/language.operators.logical.php">logical</a></td>
</tr>
<tr>
<td>left</td>
<td>,</td>
<td width="248">many uses</td>
</tr>
</tbody>
</table>
<p>For operators that have the same precedence, the order is specified in the first column.<br>
PHP also knows about <strong>Asociativity</strong>.</p>
<p>Exception:</p>
<pre class="lang:default decode:true"> if (!$a = foo())</pre>
<p>Even if<strong> = </strong>has lower precedence than other operators (<strong>!</strong> here) the return falue of <strong>foo()</strong> is put into <strong>$a</strong>  before the negation</p>
