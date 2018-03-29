class initialization
registerSystemAnnouncements

	self unregisterSystemAnnouncements.
	SystemAnnouncer uniqueInstance weak
		when: ClassRemoved, ClassAdded, ClassModificationApplied send: #handleClassChange: to: self;
		when: MethodRemoved, MethodAdded, MethodModified send: #handleMethodChange: to: self