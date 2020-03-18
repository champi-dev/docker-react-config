.PHONY: dev test help
.DEFAULT_GOAL: help

default: help

help: ## Output available commands
	@echo "Available commands:"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

prod:  ## Build for production
	@docker-compose build prod
	@docker-compose run prod

dev:  ## Run a development environment on port 3000
	@docker-compose build dev
	@docker-compose up dev

test: ## Run the current test suite
	@docker-compose build test
	@docker-compose up test
