# puppeteer-docker
Docker container to render PDF files using puppeteer

## Build the Docker image
```
docker build . -t openitcockpit/puppeteer -f Dockerfile
```

## Run Container (for developments) with mount host folder 'app'
```
docker run --rm -it --init -p 8084:8084 \
    -v $(pwd)/app:/app \
    openitcockpit/puppeteer /bin/bash
```

## Run webservices in docker
```
node webservices.js
```

## curl Test command
```
curl -X POST -H 'Content-Type: application/json' -d '{"html": "<!DOCTYPE html><html><head><title>PDF test</title></head><body><p>It works!</p></body></html>"}' http://localhost:8084/pdf --output result.pdf
```

https://stackoverflow.com/questions/47587352/opening-local-html-file-using-puppeteer



## Debugging
To debug this, open the `area_chart_template.html` file in your web browser. You can use console.log and dev tools as you are used to it.