.PHONY: it
it: coding-standards static-code-analysis tests ## Runs the coding-standards, static-code-analysis, and tests targets

.PHONY: coding-standards
coding-standards: vendor ## Normalizes composer.json with ergebnis/composer-normalize, lints YAML files with yamllint and fixes code style issues with friendsofphp/php-cs-fixer
	tools/composer-normalize
	yamllint -c .yamllint.yaml --strict .
	mkdir -p .build/php-cs-fixer
	tools/php-cs-fixer fix --config=.php_cs --diff --diff-format=udiff --verbose

.PHONY: help
help: ## Displays this list of targets with descriptions
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: tests
tests: vendor ## Runs tests with phpunit/phpunit
	mkdir -p .build/phpunit
	composer dump-autoload
	vendor/bin/phpunit --configuration=phpunit.xml

.PHONY: static-code-analysis
static-code-analysis: vendor ## Runs a static code analysis with vimeo/psalm
	mkdir -p .build/psalm
	composer dump-autoload
	tools/psalm --config=psalm.xml --diff --diff-methods --show-info=false --stats --threads=4

vendor: composer.json
	composer validate --strict
	composer install --no-interaction --no-progress --no-suggest
