execution
badge: aNumber
	"if zero reset to nil to make it dissapear"
	badge := aNumber = 0 
		ifTrue: [ nil ]
		ifFalse: [ aNumber ]