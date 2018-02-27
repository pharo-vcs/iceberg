tests - changes
testDiffWithBranch
	|  diff change methodChange | 
	self scenarioOutgoingCommit.
	
	diff := repository headCommit diffTo: repository branch upstream.

	methodChange := diff tree / #'Pharo-Git-Test' / 'Test' / 'versionNumber'.
	self assert: methodChange value isModification