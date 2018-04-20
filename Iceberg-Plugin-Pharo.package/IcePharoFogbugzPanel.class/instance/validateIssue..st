private
validateIssue: aString
	| number |

	fetched := false.
	aString size = 5 ifFalse: [ ^ self ].
	aString isAllDigits ifFalse: [ ^ self ].
	number := aString asNumber.
	(issue isNil or: [ issue number ~= number ]) ifFalse: [ ^ self ].
	
	issue := PharoIssue number: number.
	[ 	"Fork to allow UI to continue"
		issue downloadTitle.
		UIManager default defer: [ 
			self updateText: (self sanitizeTitle: issue title) ] ] fork