private
cachedValues 
	CachedValues ifNil: [ 
		CachedValues := Dictionary new.
		"This is just a cleanup mechanism... in general iceberg will be scanning 
	 	 a full repository and each proxy will be pointing to same commit so no 
	    point in keep it waiting"
		[  60 seconds wait. 
		 	CachedValues := nil ] fork ].
	^ CachedValues