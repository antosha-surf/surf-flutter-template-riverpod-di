# Runs pub get
pg:
	fvm flutter pub get

# Sorts arb files alphabetically
sort_arb:
	fvm dart run arb_utils:sort lib/l10n/intl_en.arb
	fvm dart run arb_utils:sort lib/l10n/intl_ar.arb

# Spider -> https://pub.dev/packages/spider
spider:
	spider build

# Runs flutter clean
cleanup:
	fvm flutter clean

# Create for screen template
screen:
	mason make screen

# Sets up environment variables
env:
	sh scripts/env/setup.sh

# Prepare reviewers in Gitlab
prepare_gitlab_reviewers:
	sh ./scripts/ci/prepare_gitlab_reviewers.sh

# Makes lint
lint:
	fvm flutter analyze
	fvm dart run custom_lint

# Codegen
codegen:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# For developers: build_runner watch
brw:
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

# Codegen watch
cgw:
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

# Download iOS certificates & provisioning profile
certificates:
	sh scripts/ios/download_certificates.sh

# Unit and widget tests
tests:
	fvm flutter test

# Update goldens
ug:
	fvm flutter test --update-goldens

# Runs pre-push operations
prepush:
	make lint && make sort_arb && make ug

# Pod install
pods:
	pod install --repo-update --project-directory=ios

# Validating script
validate:
	make lint && make tests

# Dowload localizations
pull_arb:
ifndef branch
	cd scripts/node/ && npm i && npm run download:master
else
	cd scripts/node/ && npm i && node ./processLocales.js task=download branch=$(branch)
endif

# Upload localizations
push_arb:
	cd scripts/node/ && npm i && npm run upload

# Compre localizations local vs cloud
verify_arb:
ifndef branch
	cd scripts/node/ && npm i && npm run verify
else
	cd scripts/node/ && npm i && node ./processLocales.js task=compare branch=$(branch)
endif

check_unused_arb:
	rm -rf lib/l10n/download
	fvm dart run translations_cleaner list-unused-terms -e
	fvm dart run scripts/dart/process_unused_arb.dart

# Release-Staging on both platforms
build_staging:
ifndef branch
	sh scripts/ci/build_staging_both.sh
else
	sh scripts/ci/build_staging_both.sh $(branch)
endif


# Release-Staging on iOS
build_staging_ios:
ifndef branch
	sh scripts/ios/build_staging.sh
else
	sh scripts/ios/build_staging.sh $(branch)
endif

# Release-Production on iOS
build_production_ios:
ifndef branch
	sh scripts/ios/build_production.sh
else
	sh scripts/ios/build_production.sh $(branch)
endif

# Release-Staging on Android with GMS
build_staging_android:
ifndef branch
	sh scripts/android/build_staging.sh
else
	sh scripts/android/build_staging.sh $(branch)
endif

# Release-Staging on Android (no GMS)
build_staging_huawei:
	sh scripts/android/build_staging_no_gms.sh

# Release-Production on Android with GMS
build_production_android:
ifndef branch
	sh scripts/android/build_production.sh
else
	sh scripts/android/build_production.sh $(branch)
endif

# Release-Production on Android (no GMS)
build_production_huawei:
	sh scripts/android/build_production_no_gms.sh

# Release-Production on both platforms
build_production:
ifndef branch
	sh scripts/ci/build_production_both.sh
else
	sh scripts/ci/build_production_both.sh $(branch)
endif

build_pci_dss_rasp_on:
	sh scripts/ci/build_pci_dss_rasp_on.sh

build_pci_dss_rasp_off:
	sh scripts/ci/build_pci_dss_rasp_off.sh

# Increments build number for CI builds
ci_increment_build_number:
	sh scripts/git/inc.sh

# Sometimes cache is stuck thus cleanup.
e2e_codegen: cleanup pg codegen

# iOS simulators shutdown before running tests
ios_similators_shutdown_all:
	xcrun simctl shutdown all

# Opens iOS simulator
open_ios_simulator:
	xcrun simctl boot "iPhone 14"

# Closes iOS simulator
close_ios_simulator:
	xcrun simctl shutdown "iPhone 14"

e2e_run:
	fvm flutter drive --target integration_test/gherkin_suite_test.dart --driver test_driver/integration_driver.dart --flavor staging --device-id "iPhone 14"

e2e_run_retention:
	fvm flutter drive --target integration_test/gherkin_suite_test.dart --driver test_driver/integration_driver.dart --flavor staging --device-id "iPhone 14" --dart-define e2e_flow="not @application"

e2e_run_onboarding:
	fvm flutter drive --target integration_test/gherkin_suite_test.dart --driver test_driver/integration_driver.dart --flavor staging --device-id "iPhone 14" --dart-define e2e_flow=@application


# Commits build number for CI builds
ci_commit_build_number:
	sh scripts/git/commit.sh

# Setup git hooks
githooks:
	git config core.hooksPath .githooks
	chmod +x .githooks/*

# Init script CI
prepare_ci:
	make env
	fvm use
	make pg
	make codegen

# CI ENV
ci_env:
	sh scripts/ci/ci_env.sh

# Cleanup CI ENV
ci_env_cleanup:
	sh scripts/ci/cleanup.sh

# First time setup project for new developer
onboarding:
	make githooks
	brew install --cask google-cloud-sdk
	gcloud --version
	gcloud auth login
	gcloud config set project tabbydev
	make env
	fvm use
	make pg
	make codegen
	make pods
	make lint
	make certificates

# Updates splash screen with flutter_native_splash
splash:
	fvm dart run flutter_native_splash:create

# Prepare changelog
dev_changelog:
ifndef branch
	sh scripts/ci/dev_changelog.sh
else
	sh scripts/ci/dev_changelog.sh $(branch)
endif

outdated_all:
	fvm flutter pub outdated

outdated_critical:
	fvm flutter pub outdated | grep 'riverpod\|auto_route\|firebase\|flutter_secure_storage\|chat'

outdated:
	sh scripts/common/check_outdated.sh

git_last_tag:
	node scripts/node/setGitLastTag.js

deps:
	fvm flutter pub deps

remove_mocks:
	sh scripts/common/remove_mocks.sh

restore_mocks:
	sh scripts/common/restore_mocks.sh

remove_rasp:
	sh scripts/common/remove_rasp.sh

restore_rasp:
	sh scripts/common/restore_rasp.sh

# Hard reset
hard_reset:
	fvm flutter clean
	rm -rf .idea
	rm -rf .dart_tool
	fvm flutter pub cache clean