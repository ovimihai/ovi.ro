---
layout: post
title: "MongoDB more indexes on Secondaries"
date: 2017-05-26
permalink: /mongodb/mongodb-more-indexes-on-secondaries/
categories: ["MongoDB"]
tags: []
---
<p>I&#8217;ve been wondering for a time if it works, the documentation is not really clear if you can have different indexes on a replicaset secondary, maybe delayed or with priority 0.</p>
<p>Using this feature you can do reports&nbsp;better on a secondary (maybe delayed too) secondary server. Make sure the journal is big enough to allow secondary indexes to be built.</p>
<h2>Step 1: Build replica set</h2>
<p>a. Here are the replica set config files:</p>
<table>
<tbody>
<tr>
<td>
<pre class="toolbar:1 lang:default decode:true" title="mongodb-rpl-s0.conf">dbpath = /tmp/mongo/data
logpath = /tmp/mongo/log.log
replSet = rs0
port = 27100
fork = true
smallfiles = true
</pre>
</td>
<td>
<pre class="toolbar:1 lang:default decode:true" title="mongodb-rpl-s1.conf">dbpath = /tmp/mongo/data1
logpath = /tmp/mongo/log1.log
replSet = rs0
port = 27101
fork = true
smallfiles = true
</pre>
</td>
<td>
<pre class="toolbar:1 lang:default decode:true" title="mongodb-rpl-s2.conf">dbpath = /tmp/mongo/data2
logpath = /tmp/mongo/log2.log
replSet = rs0
port = 27102
fork = true
smallfiles = true
</pre>
</td>
</tr>
</tbody>
</table>
<p>b. Start servers</p>
<pre class="lang:sh decode:true ">&gt; mongod --config mongodb-rpl-s0.conf
&gt; mongod --config mongodb-rpl-s1.conf
&gt; mongod --config mongodb-rpl-s2.conf</pre>
<p>c. Configure replica set members</p>
<pre class="lang:js decode:true">&gt; mongo --port 27100
rs.add("127.0.0.1:27100")
rs.add("127.0.0.1:27101")
rs.add({_id:2, host:"127.0.0.1:27102",priority:0})</pre>
<p>d. Add some data and indexes</p>
<pre class="lang:js decode:true">use testdb
db.test.insert({a:1,b:1,c:1})
db.test.insert({a:2,b:2,c:2})
db.test.insert({a:3,b:3,c:3})
db.ensureIndex({a:1})</pre>
<h2>Step 2. Separate node and add indexes</h2>
<p>a. Remove node from replicaset</p>
<pre class="lang:js decode:true">rs.remove("127.0.0.1"27102")</pre>
<p>b. Stop server</p>
<pre class="lang:default decode:true">&gt; mongo --port 27102
use admin
db.db.shutdownServer()</pre>
<p>c. Modify config outside the replica set</p>
<pre class="toolbar:1 lang:default decode:true" title="mongodb-rpl-s2.conf">dbpath = /tmp/mongo/data2
logpath = /tmp/mongo/log2.log
# replSet = rs0
port = 27102
fork = true
smallfiles = true
</pre>
<p>d. Start server</p>
<pre class="lang:sh decode:true">&gt; mongod --config mongodb-rpl-s2.conf</pre>
<p>e. Add index</p>
<pre class="lang:js decode:true">use testdb
db.test.ensureIndex({c:1})</pre>
<p>f. Meanwhile on the primary some inserts happen</p>
<pre class="lang:js decode:true">db.test.insert({a:4,b:4,c:4})
db.test.insert({a:5,b:5,c:5})</pre>
<h2>Step 3. Rebuild replica set</h2>
<p>a. Stop separated slave</p>
<pre class="lang:default decode:true">mongo --port 27102
use admin
db.db.shutdownServer()</pre>
<p>b. Modify back the config</p>
<pre class="toolbar:1 lang:default decode:true" title="mongodb-rpl-s2.conf">dbpath = /tmp/mongo/data2
logpath = /tmp/mongo/log2.log
replSet = rs0
port = 27102
fork = true
smallfiles = true</pre>
<p>c. Start server again</p>
<pre class="lang:sh decode:true">&gt; mongod --config mongodb-rpl-s2.conf</pre>
<p>d. Add back to replica set</p>
<pre class="lang:js decode:true">&gt; mongo --port 27100
rs.add({_id:2, host:"127.0.0.1:27102",priority:0})</pre>
<p>e. Wait for synchronisation</p>
<pre class="lang:js decode:true">&gt; mongo --port 27102
use testdb
db.test.find() // documents with a:1 and a:2 will be synced</pre>
<p>f. Test queries on primary</p>
<pre class="lang:js decode:true">mongo --port 27100
db.test.find({a:1}).explain()
{
        "cursor" : "BtreeCursor a_1",
        "indexBounds" : {"a" : [[1,1]]},
        ...
}
db.test.find({c:1}).explain()    // NO INDEX ON c
{
        "cursor" : "BasicCursor",
         ...
}</pre>
<p>g. Test queries on&nbsp;node 2</p>
<pre class="lang:js decode:true">mongo --port 27102
db.test.find({a:1}).explain()
{
        "cursor" : "BtreeCursor a_1",
        "indexBounds" : {"a" : [[1,1]]},
        ...
}
db.test.find({c:1}).explain()    // HAVE AN INDEX ON c
{
        "cursor" : "BtreeCursor c_1",
        "indexBounds" : {"c" : [[1,1]]},
        ...
}</pre>
<p>Didn&#8217;t have time for benchmarking, will do probably this in another post</p>
