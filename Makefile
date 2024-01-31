
gen:
	flutter pub  run build_runner build

gen-c:
	flutter pub run build_runner build --delete-conflicting-outputs
gen-w:
	flutter pub run build_runner watch --delete-conflicting-outputs
clean:
	flutter pub run build_runner clean

