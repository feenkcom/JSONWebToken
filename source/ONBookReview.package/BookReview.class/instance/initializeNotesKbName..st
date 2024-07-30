initialization
initializeNotesKbName: aString
	notesKbName := aString.
	notesKb := LeDatabase databaseNamed: self notesKbName