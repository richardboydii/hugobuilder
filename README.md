# Hugo Builder

A very small, Alpine-based container that is used to build your Hugo static 
site. Great to incorporate into CI / CD pipelines.

## Getting Started

The main goal of the container is to build your static site. It uses a volume 
at `/project` to mount your Hugo project then builds it. The ENTRYPOINT for the 
container is `hugo` with the default CMD being `-v -d /project/build`. The 
container will build your site and verbose mode and dump the output to the 
`build` directory.

### Prerequisites

All you need is Docker and a Hugo project.

### Installing
Pull the latest image:
```
docker pull richardboydii/hugobuilder:latest
```

Example usage:
```
docker run -v ${PWD}:/project richardboydii/hugobuilder:latest
```

## Deployment

When using in a CI / CD pipeline, make sure to ignore the `build` directory or 
specify an alternative build path. 
