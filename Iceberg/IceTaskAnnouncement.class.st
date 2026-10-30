"
I announce a change in an IceTask.
"
Class {
	#name : 'IceTaskAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'task'
	],
	#category : 'Iceberg-Tasks',
	#package : 'Iceberg',
	#tag : 'Tasks'
}

{ #category : 'instance creation' }
IceTaskAnnouncement class >> task: aTask [

	^ self new
		  task: aTask;
		  yourself
]

{ #category : 'accessing' }
IceTaskAnnouncement >> task [

	^ task
]

{ #category : 'accessing' }
IceTaskAnnouncement >> task: aTask [

	task := aTask
]
