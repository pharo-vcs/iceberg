writing
writePackage: aDefinition
	"I'm assuming first category is actually the package"
	packageDir := aDefinition categories first.
	^ self packageDir ensureCreateDirectory