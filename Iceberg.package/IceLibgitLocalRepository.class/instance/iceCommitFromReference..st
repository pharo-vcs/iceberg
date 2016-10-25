private
iceCommitFromReference: ref
	^ self frontend 
		commitAt: ref targetId hexString
		ifAbsentPut: [ self class parseCommitInfo: ref object ]
