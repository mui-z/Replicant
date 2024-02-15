.PHONY: template

open:
	open Replicant.xcworkspace	


template:
	genesis generate templates/template.yml -d ReplicantPackage/Sources/ReplicantPackage/

format:
	swiftformat .
