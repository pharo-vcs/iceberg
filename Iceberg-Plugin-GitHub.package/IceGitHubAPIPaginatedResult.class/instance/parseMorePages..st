private
parseMorePages: aString 
	"github does not send 'Links' header if there are no pages, and it does not sends 'next' link
	 if we are at the last page"
	aString ifNil: [ ^ false ].
	^ (aString substrings: ',') anySatisfy: [ :each | each includesSubstring: 'rel="next"' ] 