#!/usr/bin/env python
import urllib2, json
response = json.loads(urllib2.urlopen('http://graph.facebook.com/londonhackspace').read())
print "likes:%s" % response['likes']
