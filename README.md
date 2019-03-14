# Drone kubectl set image plugin

### Example:

```
  - name: release
    when:
      branch:
        - master
      event:
        exclude:
          - pull_request
    image: yitsushi/drone-k8s-set-image:1.13.4
    settings:
      deployment: my-deployment
      container: my-container
      namespace: my-namespace
      repo: name/myrepo
      tag: ${DRONE_COMMIT_AFTER}
```

This is equivalent to:

```
kubectl set image \
  deployment/my-deployment \
  my-container=name/myrepo:longhashhere \
  --namespace my-namespace
```


### Simple one:

```
  - name: release
    when:
      branch:
        - master
      event:
        exclude:
          - pull_request
    image: yitsushi/drone-k8s-set-image:1.13.4
    settings:
      deployment: my-site
      repo: name/myrepo
      tag: ${DRONE_COMMIT_AFTER}
```

This is equivalent to:

```
kubectl set image \
  deployment/my-site \
  my-site=name/myrepo:longhashhere \
  --namespace default
```
