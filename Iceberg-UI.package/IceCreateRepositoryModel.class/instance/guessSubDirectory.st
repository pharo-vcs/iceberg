actions
guessSubDirectory
	"If a '.filetree' file, there is a high chance that this is a smalltalk code directory. In that case, the directory containing it is probably the subdirectory of the repository."

	| location |
	location := localDirectoryLocation location.
	location files
		detect: [ :file | file basename = '.filetree' ]
		ifFound: [ :dir | subdirectory text: '' ]
		ifNone: [ location directories do: [ :directory | directory files detect: [ :file | file basename = '.filetree' ] ifFound: [ :file | subdirectory text: directory basename ] ] ]