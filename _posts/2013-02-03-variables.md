---
layout: post
title: "Variables"
date: 2013-02-03
permalink: /php/variables/
categories: ["PHP", "PHP Basics", "ZCE Training"]
tags: ["$this", "context", "global", "scope", "superglobal", "variable variables", "variables"]
---
<p>Variables are preceded in PHP by a dollar sign $ and the rules for naming are: <strong><em>[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*</em></strong><em>   or in plain english names of variables can begin with letters or underscores and then you can put other numbers letters and underscores. Letters here can include extended <a title="ASCII TABLE" href="http://www.ascii-code.com/" target="_blank" rel="noopener noreferrer">ascii</a> characters from 7F to FF (127 &#8211; 255) so don&#8217;t blame me if you find letters like ç, † or ½</em></p>
<p>When declaring a variable, in PHP you don&#8217;t need to specify a type, it&#8217;s enough to give it a name and assign it a value. $var = &#8220;string value&#8221;;</p>
<p>Variables are <strong>case sensitive</strong> and some variable names are reserved: <strong>$this </strong>( used inside objects)<strong>, $_SERVER, $GLOBALS, $_SESSION, $_COOKIE, $_POST, $_GET, $_REQUEST, $_ENV </strong>(global variables).</p>
<p>When variables are not assigned values they behave as in the table above, but an E_NOTICE error is issued, and it is not recomanded to not properly initialize them or check if they are set with <strong>isset() </strong>function.</p>
<table class="with-borders">
<tbody>
<tr>
<th>Situation</th>
<th>Value</th>
</tr>
<tr>
<td>
<pre class="lang:default decode:true">var_dump($unset_var);</pre>
</td>
<td> <strong>NULL</strong>
</td>
</tr>
<tr>
<td>
<pre class="lang:default decode:true  crayon-selected">echo($unset_bool ? "true\n" : "false\n");</pre>
</td>
<td> <strong>false</strong>
</td>
</tr>
<tr>
<td>
<pre class="lang:default decode:true">$unset_str .= 'abc';
var_dump($unset_str);</pre>
</td>
<td>
<strong> abc</strong>   ( &#8221; concatenated with &#8216;abc&#8217; )</td>
</tr>
<tr>
<td>
<pre class="lang:default decode:true crayon-selected">$unset_int += 25;
var_dump($unset_int);</pre>
</td>
<td> <strong>25</strong>  ( 0+25 )</td>
</tr>
<tr>
<td>
<pre class="lang:default decode:true">$unset_float += 1.25;
var_dump($unset_float);</pre>
</td>
<td>
<strong> 1.25</strong>  ( 0+ 1.25)</td>
</tr>
<tr>
<td>
<pre class="lang:default decode:true">$unset_arr[3] = "def";
var_dump($unset_arr);</pre>
</td>
<td> <strong>array(1) {  [3]=&gt;  string(3) &#8220;def&#8221; }</strong><br>
adds empty array() with array with element key: 3, value &#8220;def&#8221;</td>
</tr>
<tr>
<td>
<pre class="lang:default decode:true">$unset_obj-&gt;foo = 'bar';
var_dump($unset_obj);</pre>
</td>
<td>
<strong> object(stdClass)#1 (1) {  [&#8220;foo&#8221;]=&gt;  string(3) &#8220;bar&#8221; }</strong><br>
initializes an stdClass() object and assigns parameter foo the value &#8216;bar&#8217;</td>
</tr>
</tbody>
</table>
<h3>Variable variables</h3>
<p>In PHP you even can have dynamic names for variables! You can create a variable using another variable value as it&#8217;s name</p>
<pre class="lang:default decode:true">$varName = 'newvar';
$$varName = 'abc';

echo $newvar;</pre>
<p>Variable variables can be defined as above or if you want to use an array key as name, you have to use curly brackets to avoid the ambiguity</p>
<pre class="lang:default decode:true">$a = array('hello', 'world');
${$a[1]} = 'value';

echo $world;</pre>
<p>It works with object properties too</p>
<pre class="lang:default decode:true">$var = 'property';
$obj-&gt;$var;

// or even
$obj-&gt;{$start . $stop};</pre>
<p>If this is not too much already, try looking at the <a title="Example #1 - Variable variables - PHP Manual" href="https://php.net/manual/en/language.variables.variable.php" target="_blank" rel="noopener noreferrer">Example #1 in the PHP manual</a></p>
<h3>Variable scope</h3>
<p>Variable scope refers to the availability of variables in different contexts.</p>
<pre class="lang:default decode:true">$globalVar = 1;

function abc(){
  $localVar = 2;
  $globalVar = 2; // this is still local, and it doesn't affect the variable outside the function
}
abc();
echo $globalVar; // echoes 1 !</pre>
<p>Inside functions you can access global variables using the keyword <strong>global</strong></p>
<pre class="lang:default decode:true">$var = 1;

function do_something(){
  global $var;
  $var = 2;
}
do_something();

echo $var; // echoes 2</pre>
<p>Global variables can be accessed using special PHP predefined variable <strong>$GLOBALS</strong></p>
<pre class="lang:default decode:true">$var = 2;

function do_something(){
  $GLOBAL['var'] = 3;
}
do_something();

echo $var; // echoes 3</pre>
<p>Some of the predefined PHP variables are <strong>superglobals</strong> and can be accessed anywhere without the global keyword: $GLOBALS, $_SERVER, $_GET, $_POST, $_FILES, $_COOKIE, $_SESSION, $_REQUEST, $_ENV;</p>
<p>&nbsp;</p>
