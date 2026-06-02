---
layout: post
title: "Compare strings in PHP"
date: 2017-04-04
permalink: /php/sadness/compare-strings-in-php/
categories: ["Sadness"]
tags: ["madness", "php", "strings"]
---
<p>Just read a <a href="https://php.net/manual/en/language.operators.comparison.php#114682">comment</a> in the PHP documentation and had another PHP madness moment.</p>
<p>It seems you have to be really, really careful when comparing strings that include numbers&#8230;</p>
<p>&nbsp;</p>
<table>
<tbody>
<tr>
<td width="800">Command \ PHP Version</td>
<td width="75">7.0.0 &#8211; 7.1.3</td>
<td width="83">5.4.4 &#8211; 5.6.30</td>
<td width="76">5.2.1 &#8211; 5.4.3</td>
</tr>
<tr>
<td>var_dump(&#8216;123&#8217; == &#8216;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 123&#8217;);</td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
</tr>
<tr>
<td>var_dump(&#8216;1e3&#8217; == &#8216;1000&#8217;);</td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;+74951112233&#8217; == &#8216;74951112233&#8217;);</td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;00000020&#8217; == &#8216;0000000000000000020&#8217;);</td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
</tr>
<tr>
<td>var_dump(&#8216;0X1D&#8217; == &#8217;29E0&#8242;);</td>
<td style="font-weight: 400;"><strong><span style="color: #ff0000;">FALSE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;0xafebac&#8217; == &#8216;11529132&#8217;);</td>
<td style="font-weight: 400;"><strong><span style="color: #ff0000;">FALSE</span></strong></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
</tr>
<tr>
<td>var_dump(&#8216;0xafebac&#8217; == &#8216;0XAFEBAC&#8217;);</td>
<td style="font-weight: 400;"><strong><span style="color: #ff0000;">FALSE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;0xeb&#8217; == &#8216;+235e-0&#8217;);</td>
<td style="font-weight: 400;"><span style="color: #ff0000;"><strong>FALSE</strong></span></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;0.235&#8217; == &#8216;+.235&#8217;);</td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;0.2e-10&#8217; == &#8216;2.0E-11&#8217;);</td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #339966;">TRUE</span></strong></td>
</tr>
<tr>
<td>var_dump(&#8216;61529519452809720693702583126814&#8217; == &#8216;61529519452809720000000000000000&#8217;);</td>
<td style="font-weight: 400;"><strong><span style="color: #ff0000;">FALSE</span></strong></td>
<td style="font-weight: 400;"><strong><span style="color: #ff0000;">FALSE</span></strong></td>
<td style="font-weight: 400;"><span style="color: #339966;"><strong>TRUE</strong></span></td>
</tr>
</tbody>
</table>
<p>https://3v4l.org/rop5S</p>
