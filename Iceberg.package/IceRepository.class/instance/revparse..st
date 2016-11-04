private
revparse: aString 
	"Right now this is necessary because Metacello provides a tag objectId instead of a commitId
	Reported as https://github.com/dalehenrich/metacello-work/issues/422"
	^ self backend revparse: aString