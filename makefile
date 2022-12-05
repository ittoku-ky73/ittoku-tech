API_REPO  = https://github.com/ittoku-ky73/api-ittoku-tech.git
BLOG_REPO = https://github.com/ittoku-ky73/blog-ittoku-tech.git

clone_repo:
	git clone $(API_REPO)
	mv api-ittoku-tech/ api/
	git clone $(BLOG_REPO)
	mv blog-ittoku-tech blog

DEV_FILE    = docker-compose.dev.yml
DEV_PROJECT = ittoku-tech
DEV_COMPOSE = docker-compose -f $(DEV_FILE) -p $(DEV_PROJECT)

setup:
	$(DEV_COMPOSE) build
	$(DEV_COMPOSE) run --rm api rails db:setup
	$(DEV_COMPOSE) run --rm web npm install

up:
	$(DEV_COMPOSE) up

down:
	$(DEV_COMPOSE) down

db_postgres:
	$(DEV_COMPOSE) exec db psql app_development -U postgres

api_bash:
	$(DEV_COMPOSE) exec api bash

web_bash:
	$(DEV_COMPOSE) exec web bash

TEST_FILE    = docker-compose.test.yml
TEST_PROJECT = ittoku-tech-test
TEST_COMPOSE = docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT)

setup_test:
	$(TEST_COMPOSE) build
	$(TEST_COMPOSE) run --rm web npm install

up_test:
	$(TEST_COMPOSE) up

api_test:
	$(TEST_COMPOSE) exec api rails test

web_test:
	$(TEST_COMPOSE) exec web npm test

api_bash_test:
	$(TEST_COMPOSE) exec api bash

web_bash_test:
	$(TEST_COMPOSE) exec web bash

down_test:
	$(TEST_COMPOSE) down
