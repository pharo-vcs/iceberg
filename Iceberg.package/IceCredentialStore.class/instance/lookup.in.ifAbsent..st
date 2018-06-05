private - lookup
lookup: aUrlString in: dict ifAbsent: aBlock

	| aUrl |
	aUrl := self parseUrl: aUrlString.

	"1 - lookup perfect match"
	dict at: (self buildKey: aUrl) ifPresent: [ :found | ^ found ].
	
	"2 - Trying hostname only"
	dict at: (self buildKey: aUrl clearPath) ifPresent: [ :found | ^ found ].
	
	"Last if we could not found it"
	^ aBlock value