accessing
allTypes
	^ self allSubclasses select: [ :each | each isAbstract not ]