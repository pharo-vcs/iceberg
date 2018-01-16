utilities
loadDefinitions
 	| entry segments className classIsMeta |	
	
	definitions := OrderedCollection new.
	
	segments := (self fileName substrings: '/') allButLast asOrderedCollection.
	classIsMeta := segments removeLast = 'class'.
	className := segments last copyUpToLast: $..
	
	entry := (packageDirectory 
		entryByPath: (self fileName allButFirst: packageDirectory filename size)
		ifAbsent: [ ^ nil ]).
	entry readStreamDo: [ :fileStream |
		| category source timestamp selector |

		category := fileStream nextLine.
		source := fileStream upToEnd.
 		selector := self methodSelectorFor: source.
 		timestamp := stream author name, ' ' , stream time asDateAndTime asStringYMDHM.
		definitions add: (MCMethodDefinition
			className: className
			classIsMeta: classIsMeta
			selector: selector
			category: category
			timeStamp: timestamp
			source: source) ]