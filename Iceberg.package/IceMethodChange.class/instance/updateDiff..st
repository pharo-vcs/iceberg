*Iceberg-UI
updateDiff: aDiffModel
	aDiffModel
		contextClass: self operation targetClass;
		leftText: self operation diffToSource;
		rightText: self operation diffFromSource.
