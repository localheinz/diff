.PHONY: it
it: coding-standards tests ## Runs the coding-standards and tests targets

.PHONY: code-coverage
code-coverage: vendor ## Collects code coverage from running unit tests with phpunit/phpunit
	vendor/bin/phpunit --configuration=phpunit.xml --coverage-text

.PHONY: coding-standards
coding-standards: vendor ## Lints YAML files with yamllint, normalizes composer.json with ergebnis/composer-normalize, and fixes code style issues with friendsofphp/php-cs-fixer
	yamllint -c .yamllint.yaml --strict .
	tools/composer-normalize
	tools/php-cs-fixer fix --config=.php-cs-fixer.php --diff --diff-format=udiff --verbose

.PHONY: help
help: ## Displays this list of targets with descriptions
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: tests
tests: vendor ## Runs unit tests with phpunit/phpunit
	composer dump-autoload
	vendor/bin/phpunit --configuration=phpunit.xml

vendor: composer.json
	composer validate --strict
	composer install --no-interaction --no-progress
