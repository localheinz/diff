.PHONY: it
it: coding-standards tests ## Runs the coding-standards and tests targets

.PHONY: coding-standards
coding-standards: vendor ## Lints YAML files with yamllint
	yamllint -c .yamllint.yaml --strict .

.PHONY: help
help: ## Displays this list of targets with descriptions
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: tests
tests: vendor ## Runs tests with phpunit/phpunit
	mkdir -p .build/phpunit
	vendor/bin/phpunit --configuration=phpunit.xml

vendor: composer.json
	composer validate --strict
	composer install --no-interaction --no-progress --no-suggest
