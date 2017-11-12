initialization
computeReferenceCommit
	| candidates |
	
	"1. If no code has been loaded, take HEAD commit as reference."
	self loadedVersions isEmpty ifTrue: [ ^ self repository headCommit ].
		
	"2. Happy path: see if all loaded code has the same updation commit. 
	If we can't compute an updation commit for some loaded code, it means that it has been 
	probably loaded from another kind of repository, we just ignore it."

	candidates := (self loadedVersions collect: [:version | version commit] as: Set) reject: #isNil.
	(candidates size = 1) ifTrue: [ | sorted |
		sorted := candidates sorted: [ :a :b | a parents includes: b ].
		"If there is no newer commit for this repository until the loaded one we use the
		head commit instead. This covers the case where commits external to pharo happened
		since last time the package was loaded"
		^ (repository headCommit changedPackagesTo: candidates anyOne)
			ifNotEmpty: [ candidates anyOne ]
			ifEmpty: [ repository headCommit ] ].		

	"If there are more than one versions as candidates try to bring them in anchestry order.
	If all are consistent in the anchestry chain then the first element is the most actual"
	(candidates size > 1) ifTrue: [ | consistent |
		"sort by anchestry"
		consistent := true.
		"check if all versions are related"
		candidates := candidates sorted: [ :a :b | a parents includes: b ].
		candidates pairsDo: [ :a :b |
			(a parents includes: b) ifFalse: [ consistent := false ] ].
		consistent ifTrue: [ 
			^ (repository headCommit changedPackagesTo: candidates first)
				ifNotEmpty: [ candidates first ]
				ifEmpty: [ repository headCommit ] ] ] .

	"3. None of the loaded versions produced a non nil candidate, just use the HEAD commit"	
	candidates isEmpty ifTrue: [ ^ self repository headCommit ].

	"4. We could try other strategies... but this should be good for now."	
	^ candidates detectMax: #datetime 