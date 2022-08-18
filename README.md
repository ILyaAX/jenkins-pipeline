# jenkins-pipeline

Using Jenkins pipeline to build and prototype a Java application. The assembly must take place in an assembly container. The build artifact must be a Docker image with application.
----------------------------------------------------------------------------

First you need to create an image inside which the application image will be created. And after creating the image, place it in the repository:
```
docker build -t artifact.ml:8888/build https://github.com/ILyaAX/jenkins-pipeline.git#main:
docker push artifact.ml:8888/build
```
