private
refresh
	commits := nil.
	upstream ifNotNil: #refresh.
	versionDictionary := Dictionary new.