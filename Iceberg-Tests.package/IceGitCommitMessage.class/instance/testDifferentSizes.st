tests
testDifferentSizes
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |

	msg := ''.
	
	1 to: 40 do: [ :size | 
		msg := msg , (size % 10) asString.
		repository commitWithMessage: msg.
		self assert: repository head commit comment equals: msg.
		repository workingCopy addPackageNamed: 'NewPackage' , size asString.
	].
