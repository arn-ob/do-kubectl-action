# do-kubectl-action

Access your DigitalOcean cluster via kubectl in a Github Action.

## Example 

```yaml
jobs:
  update-image:
    name: Build docker image
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Push the build image to the DO kubectl
        uses: arn-ob/do-kubectl-action@main
        with:
          do_access_token: ${{ secrets.DO_ACCESS_TOKEN }}
          do_cluster_certificate: ${{ secrets.DO_CLUSTER_CERTIFICATE }}
          do_deployment_name: ${{ secrets.DO_DEPLOYMENT_NAME }}
          do_container_name: ${{ secrets.DO_CONTAINER_NAME }}
          do_image_tag: ${{ secrets.DO_IMAGE_TAG }}
```

Example

```yaml
jobs:
  update-image:
    name: Build docker image
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Push the build image to the DO kubectl
        uses: arn-ob/do-kubectl-action@main
        with:
          do_access_token: ${{ secrets.DO_ACCESS_TOKEN }}
          do_cluster_certificate: ${{ secrets.DO_CLUSTER_CERTIFICATE }}
          do_deployment_name: deploy-app
          do_container_name: deploy-app
          do_image_tag: <username>/<image-name>:<image-tag>

```
