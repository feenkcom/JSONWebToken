contracts
invariant
	"To be expanded ..."
	^ self reviewKbName = self reviewKb databaseName
		and: [ self notesKbName = self notesKb databaseName ]