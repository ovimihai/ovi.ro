---
layout: post
title: "MongoDB CRUD Operations"
date: 2013-05-22
permalink: /mongodb/mongodb-crud-operations/
categories: ["MongoDB"]
tags: []
---
<p>MongoDB is a NoSQL database and supports all the classic CRUD ( Create, Read, Update, Delete ) operations.</p>
<p>To perform all this operations you have to select first a database and use the database pointer to select a collection ( collections are tables in the SQL world )</p>
<pre class="lang:js decode:true">use DatabaseName   // select a database
db.colectionName   // point to a colection in the selected database</pre>
<p>You <strong>C</strong>reate stuff with the <strong>insert</strong> method</p>
<pre class="lang:default decode:true">db.collection.insert( document|array )</pre>
<p>MongoDB automatically creates an &#8220;_id&#8221; (MongoID) for each record you insert, but you can also specify any unique _id you want. MongoDB drivers generate the MongoID before it sends the insert to the database, so you don&#8217;t need to wait for the response to get the lastInsertedId like in SQL databases. <a title="MongoDB Create operation" href="http://docs.mongodb.org/manual/core/create/" target="_blank" rel="noopener noreferrer">See documentation</a></p>
<p>To <strong>R</strong>ead data from the database you can use the <strong>find</strong> method</p>
<pre class="lang:js decode:true">db.collection.find( query, projection )</pre>
<p>The query in MongoDB is not an SQL query, but it is an JSON-like object with some special keys for special operations, the simplest example would be something like <strong>{ key: &#8220;value&#8221; }</strong>. The projection is something similar with the field specification in SQL, by default is like &#8220;*&#8221;, you wil return the whole document. <a title="MongoDB Read operation" href="http://docs.mongodb.org/manual/core/read/" target="_blank" rel="noopener noreferrer">See documentation</a></p>
<p>To <strong>U</strong>pdate documents from the database you can use <strong>upate</strong> or <strong>save</strong> methods</p>
<pre class="lang:default decode:true">db.collection.update( query, update, options )</pre>
<p>The query is a JSON-like match to find the desired data, the update is either a whole document, either an JSON-like object using the special keys $set, $unset key values or $push to array values. The options is an object that can specify if you want multiple updates or insert if no document matched the query.</p>
<pre class="lang:default decode:true">db.collection.save( document )</pre>
<p>Save performs an update if you specify the <em>_id</em> or an insert if you don&#8217;t. <a title="MongoDB Update operation" href="http://docs.mongodb.org/manual/core/update/" target="_blank" rel="noopener noreferrer">See documentation</a></p>
<p>To <strong>D</strong>elete data you can use the <strong>remove</strong> method</p>
<pre>db.collection.remove( query, justOne )</pre>
<p>This deletes use the query to match what you want to delete and a flag for multiple or single deletes (justOne = true means only one delete) <a title="MongoDB Delete operation" href="http://docs.mongodb.org/manual/core/delete/" target="_blank" rel="noopener noreferrer">See documentation</a></p>
