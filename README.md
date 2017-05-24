# Source Configuration

* `git` Required. The source is the same as the corresponding git resource

[Git Resource Source Configuration](https://github.com/concourse/git-resource/blob/master/README.md#source-configuration)

### Example 

Resource configuration:

```YAML
resources:

# Normal git resource configuration
- name: repo
  type: git
  source: &repo-source # Create a YAML anchor so we can refer to this in the cache resource
    uri: https://github.com/hellofresh/concourse-cache-composer.git
    branch: master

# Caching composer dependency resource
- name: concourse-composer-cache
  type: composer-cache
  source:
    git: *repo-source # Point to the repo anchor
```

# Behavior

`check`: Check for cache of a commit.

`in`: Pulls composer vendor dependencies

```YAML
jobs:

  - name: cache
    plan:

      - get: repo
        trigger: true

      - get: concourse-composer-cache
```

`out`: ...
