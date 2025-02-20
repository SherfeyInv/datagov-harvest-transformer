build: ## Build the app image
	docker build -t datagov/mdtranslator . 

start:
	bundle exec rails server -b 0.0.0.0 -p 3000

lint:
	bundle exec rubocop

.PHONY: test
test:
	bundle exec rails test

# recursively finds all .rb files in the current dir and formats them using stree
format:
	find . -type f -name "*.rb" | xargs -L1 bundle exec stree write --plugins=plugin/single_quotes