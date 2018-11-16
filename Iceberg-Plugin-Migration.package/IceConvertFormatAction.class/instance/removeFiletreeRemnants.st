private
removeFiletreeRemnants
	"remove .filetree remaining"
	| filetreeFiles |
	
	filetreeFiles := self codeDirectory allChildrenMatching: '.filetree'.
	filetreeFiles do: #ensureDelete.
	self repository addFilesToIndex: (filetreeFiles collect: [ :each | 
		((each relativeTo: self codeDirectory) printWithDelimiter: $/) ]).
	