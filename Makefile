setup:
	bin/setup
	make dbreseed dbprepare

start:
	bin/dev

dbreseed:
	bin/rails db:drop db:create db:migrate db:seed RAILS_ENV=development

dbprepare:
	bin/rails db:setup db:test:prepare db:schema:load db:migrate RAILS_ENV=test

ci:
	make brakeman rubocop system

code-fix:
	make rubocop-fix

brakeman:
	bin/brakeman

rubocop:
	bin/rubocop

rubocop-fix:
	bin/rubocop -A

system:
	bin/rails db:test:prepare test:system

access-server:
	ssh root@188.245.209.207

deploy:
	bin/kamal deploy --verbose

release-lock:
	bin/kamal lock release --verbose

logs:
	bin/kamal app logs --verbose --follow

console:
	bin/kamal console --verbose

migrate:
	bin/kamal migrate --verbose
