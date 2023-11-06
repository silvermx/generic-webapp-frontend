docker build --no-cache -t silvermx/generic-webapp-frontend:latest -t silvermx/generic-webapp-frontend:$(git rev-parse HEAD) .
docker push silvermx/generic-webapp-frontend:latest
docker push silvermx/generic-webapp-frontend:$(git rev-parse HEAD)