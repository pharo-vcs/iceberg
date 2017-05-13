subdirectories
subdirectory

	"compatibility with the old API with only one subdirectory"

	^ self subdirectories 
		ifEmpty: [ nil ]
		ifNotEmpty: [ :subdirs | subdirs first ]