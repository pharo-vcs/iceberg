"
I'm a generic announcement in the iceberg context.
"
Class {
	#name : 'IceAnnouncement',
	#superclass : 'Announcement',
	#category : 'Iceberg-Announcements',
	#package : 'Iceberg',
	#tag : 'Announcements'
}

{ #category : 'testing' }
IceAnnouncement >> appliesToRepository: aRepository [
	^ false
]
