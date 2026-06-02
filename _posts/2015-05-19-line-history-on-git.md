---
layout: post
title: "Line history on Git"
date: 2015-05-19
permalink: /snippets/line-history-on-git/
categories: ["Snippets"]
tags: []
---
<p># file path<br>
export FILE=file/path<br>
# line number<br>
export LINE=10<br>
git log &#8211;format=format:%H $FILE | xargs -L 1 git blame $FILE -L $LINE,$LINE | uniq -c</p>
