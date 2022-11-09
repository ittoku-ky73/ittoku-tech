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

run:
	docker-compose up

db_postgres:
	docker-compose exec db psql app_development -U postgres

api_bash:
	docker-compose exec api bash

web_bash:
	docker-compose exec web bash
