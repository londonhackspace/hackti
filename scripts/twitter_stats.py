#!/usr/bin/env python
import urllib2, json
response = json.loads(urllib2.urlopen('http://api.twitter.com/1/users/show.json?screen_name=londonhackspace').read())
print "followers:%s listed:%s" % (response['followers_count'], response['listed_count'])
