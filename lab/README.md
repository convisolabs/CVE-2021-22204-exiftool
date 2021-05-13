# Pratical Lab

In order to illustrate an application that may use exiftool on its back-end, we developed an API prototype that is responsible for receiving images through a parameter, extracting some metadata from them and later and providing such a result in a JSON to be consumed by your customers.

At the time this publication was written, the official lib of exiftool in Cpan: Image::ExiftTool remains vulnerable, so this application can be exploited.

Setup:


```
$ docker build . -t exiflab
$ docker run -p 80:80 -d exiflab
```

Open in your browser: http://localhost and let's hack!