tests
testDifferentSizes
	"We used to have a problem that in some messages (depending of padding) the $ was added at the end"
	| msg |

	msg := ''.
	
	1 to: 40 do: [ :size | 
		msg := msg , (size % 10) asString.
		self repository commitWithMessage: msg.
		self assert: self repository head commit comment equals: msg.
		self repository workingCopy addPackageNamed: 'NewPackage' , size asString.
	].
