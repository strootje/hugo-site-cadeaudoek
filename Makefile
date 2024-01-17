SITE_URL=cadeaudoek.nl
-include .env.local

deploy:
	@hugo --environment=production --minify -d ./public/${SITE_URL}
	@kubectl cp -n=strooware ./public/${SITE_URL} caddy-sites-65d8484f47-lzn4n:/sites
	@kubectl exec -n=strooware -it service/caddy-sites -- caddy reload -fc=/etc/caddy/Caddyfile
