# GitLab CI

Using the `swiftenv` docker image, you can install a version of Swift and test
against it using GitLabs docker based CI runners.

This is what the `.gitlab-ci.yml` file looks like which can install swiftenv
and Swift 3:

```yaml
image: kylef/swiftenv

before_script:
  - swiftenv install 3.0

test:
  script:
    - swift test
```
