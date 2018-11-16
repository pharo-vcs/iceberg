private-commits
commitsInPackageCache

	^ commitsInPackageCache ifNil: [ commitsInPackageCache := LRUCache new maximumWeight: 30  ]