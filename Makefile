build: ## Build the app image
	docker build -t datagov/mdtranslator . 

start:
	rails server -b 0.0.0.0 -p 3000

lint:
	bundle exec rubocop

.PHONY: test
test:
	rails test