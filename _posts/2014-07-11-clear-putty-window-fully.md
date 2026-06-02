---
layout: post
title: "Clear putty window fully"
date: 2014-07-11
permalink: /snippets/clear-putty-window-fully/
categories: ["Snippets"]
tags: ["linux", "putty", "useful"]
---
<p>If you want to full clear putty window including the scroll history with just a command, here is your answer.<br>
It seems there is a way to clear the scroll buffer just by sending some special characters with print.</p>
<p>[php toolbar=&#8221;false&#8221;]printf &#8216;\033[3J'[/php]</p>
<p>To make it easier, just put it in your .bash_profile as a new alias:</p>
<p>[crayon toolbar=&#8221;false&#8221;]echo -e &#8220;\nalias cls=\&#8221;clear &#038;&#038; printf &#8216;\033[3J&#8217;\&#8221;\n&#8221; >> ~/.bashrc[/crayon]</p>
<p>and then you can use cls to clear both screen and putty scroll buffer.</p>
<p>&nbsp;</p>
