accessing
rightLabel: aString 
	"This allows us to be compatible with old pharo versions"
	(diffPanel respondsTo: #leftLabel:) ifFalse: [ ^ self ].
	diffPanel rightLabel: aString