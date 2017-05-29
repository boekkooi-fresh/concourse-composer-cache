# Git with composer Resource

This resource is a extension of the concourse [Git Resource](https://github.com/concourse/git-resource) that runs `composer install`.

# Source Configuration
See [Git Resource Source Configuration](https://github.com/concourse/git-resource/blob/master/README.md#source-configuration)

### Example 

Resource configuration:

```YAML
resource_types:

- name: git-with-composer
  type: docker-image
  source:
    repository: quay.io/boekkooi_fresh/concourse-composer-cache

resources:

- name: repo
  type: git-with-composer
  source:
    uri: https://github.com/hellofresh/concourse-cache-composer.git
    branch: master
```

# Behavior

`check`: Check for new commits.

See [Git Resource `check`](https://github.com/concourse/git-resource/blob/master/README.md#check-check-for-new-commits) 

`in`: Clone the repository, at the given ref and install composer dependencies.

See [Git Resource `in`](https://github.com/concourse/git-resource/blob/master/README.md#in-clone-the-repository-at-the-given-ref)

`out`: Push to a repository.

See [Git Resource `out`](https://github.com/concourse/git-resource/blob/master/README.md#out-push-to-a-repository) 
