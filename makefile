API_REPO  = https://github.com/ittoku-ky73/api-ittoku-tech.git
BLOG_REPO = https://github.com/ittoku-ky73/blog-ittoku-tech.git

clone_repo:
	git clone $(API_REPO)
	mv api-ittoku-tech/ api/
	git clone $(BLOG_REPO)
	mv blog-ittoku-tech blog

setup:
	docker-compose build
	docker-compose run --rm api rails db:setup
	docker-compose run --rm web npm install

up:
	docker-compose up

down:
	docker-compose down

db_postgres:
	docker-compose exec db psql app_development -U postgres

api_bash:
	docker-compose exec api bash

web_bash:
	docker-compose exec web bash

TEST_FILE    = docker-compose.test.yml
TEST_PROJECT = ittoku-tech-test

setup_test:
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) build
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) run --rm web npm install

up_test:
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) up

test:
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) exec api rails test
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) exec web npm test

api_bash_test:
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) exec api bash

web_bash_test:
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) exec web bash

down_test:
	docker-compose -f $(TEST_FILE) -p $(TEST_PROJECT) down
