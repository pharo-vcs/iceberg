I'm a cache that can be reseted when some announcements arrive. 
I'm used to cache values to be used on the UI. 

When reseted, I will announce IceTipCacheReseted (if announcer is defined). This is used to update lists, etc. For example: 

a list 
	display: [ someCachedModel someSelector ];
	updateOn: IceCacheReseted from: self detachedAnnouncer.

someCachedModel := SomeRealMode new beCached
	announceResetTo: self;
	resetOn: IceRepositoryForgoten;
	yourself.

