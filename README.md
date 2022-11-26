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
```
