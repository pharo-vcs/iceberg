private
isFilePartOfAPackage: aFileReferenceRelativeToRepositoryDirectory
	| segments |

	segments := aFileReferenceRelativeToRepositoryDirectory path segments.
	^ self subdirectory isEmptyOrNil
		ifTrue: [ self backend writerClass isValidPackageName: segments first ]
		ifFalse: [  
			(segments first = self subdirectory) 
				and: [ self backend writerClass isValidPackageName: segments second ] ]