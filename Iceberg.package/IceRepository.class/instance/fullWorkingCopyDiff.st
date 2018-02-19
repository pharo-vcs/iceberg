*Iceberg-Changes
fullWorkingCopyDiff
	^ IceDiff new
		source: self workingCopy;
		target: self head;
		buildFull;
		yourself