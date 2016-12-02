private
internalStoreVersion: aMCVersion
	"Inspired on MCFileTreeGitRepository."
	"Do a filetree store followed by a git add command, do not commit yet."
	"Writer is metadata dependent."

	| packageDirectoryString |

	IceMetadatalessFileTreeWriter fileOut: aMCVersion on: self.

	packageDirectoryString := aMCVersion package name , self packageExtension.
	self command: { 'add'. packageDirectoryString }
