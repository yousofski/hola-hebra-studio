# hola.hebra.studio — página puntero de Hebra Studio.
# Una página estática servida por nginx. Sin base de datos, sin PHP,
# sin panel de administración y sin sesiones que se puedan romper.
FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY assets/    /usr/share/nginx/html/assets/

EXPOSE 80
