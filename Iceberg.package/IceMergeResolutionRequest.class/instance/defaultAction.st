exceptiondescription
defaultAction

	| window mergeMorph |
	mergeMorph := (IceMergeMorph forMerger: merge).
	mergeMorph
		fromDescription: merge sourceVersion description;
		toDescription: merge targetVersion description.
	window := mergeMorph newWindow
		title: 'Merge';
		yourself.
	UIManager default openModal: window.
	^ mergeMorph merged