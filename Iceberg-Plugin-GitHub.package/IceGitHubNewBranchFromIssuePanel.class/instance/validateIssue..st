private
validateIssue: aString
	| number |

	fetched := false.
	aString trimmed isEmpty ifTrue: [ ^ self ].
	aString isAllDigits ifFalse: [ ^ self ].
	number := aString asNumber.
	(issue isNil or: [ issue number ~= number ]) ifFalse: [ ^ self ].
	
	[ 	"Fork to allow UI to continue"
		"issue := IceGitHubAPI new getIssue: owner project: projectName number: number.
		UIManager default defer: [ 
			self updateText: (self sanitizeTitle: issue title) ]" ] fork