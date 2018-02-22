instance creation
from: newNode to: oldNode

	^ self new
		oldNode: oldNode;
		modifiedNode: newNode;
		yourself