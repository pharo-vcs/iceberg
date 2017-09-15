private
isFilePartOfAPackage: aFileReferenceRelativeToRepositoryDirectory
	| segments |

	segments := aFileReferenceRelativeToRepositoryDirectory path segments.
	^ self subdirectory isEmptyOrNil
		ifTrue: [ self writerClass isValidPackageName: segments first ]
		ifFalse: [  
			(segments first = self subdirectory) 
				and: [ self writerClass isValidPackageName: segments second ] ]