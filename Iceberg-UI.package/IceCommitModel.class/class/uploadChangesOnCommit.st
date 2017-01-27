accessing
uploadChangesOnCommit
	^ UploadChangesOnCommit ifNil: [ UploadChangesOnCommit := true ]