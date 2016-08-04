private
refresh
	branch ifNotNil: #refresh.
	upstream ifNotNil: #refresh.
	commitDictionary := nil.
	savedPackages := nil.