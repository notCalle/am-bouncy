.PHONY: run
run:
	amulet

.PHONY: release
release:
	amulet export -windows -windows64 -mac -linux -html
