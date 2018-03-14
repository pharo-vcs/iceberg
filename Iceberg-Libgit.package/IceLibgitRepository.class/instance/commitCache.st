private-commits
commitCache
	
	^ commitCache ifNil: [ commitCache := LRUCache new maximumWeight: 30  ]