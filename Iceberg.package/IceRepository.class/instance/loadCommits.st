private
loadCommits
	commitDictionary := Dictionary new.
	self branch loadCommits.
	self upstream ifNotNil: #loadCommits. 

	^ commitDictionary.