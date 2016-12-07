history
lastStoredRun
	^ ((Dictionary new) add: (#timeStamp->(DateAndTime basicNew instVarAt: 1 put: 42592; instVarAt: 2 put: (Duration seconds: 3600 nanoSeconds: 0); instVarAt: 3 put: 2457696; instVarAt: 4 put: 809368000; yourself)); add: (#passed->((Set new) add: #testPackageStatus; yourself)); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)