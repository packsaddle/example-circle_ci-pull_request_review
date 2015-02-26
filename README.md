# Example::CircleCi::PullRequestReview

run rubocop and pull request review comment

[Actual script for CircleCI](./bin/run-tests.sh)

```
# circle.yml
test:
  pre:
    - bin/run-tests.sh

# bin/run-rubocop.sh
#!/bin/bash
set -v
if [ "${CIRCLE_BRANCH}" != "master" ]; then
  gem install --no-document rubocop-select rubocop rubocop-checkstyle_formatter \
              checkstyle_filter-git saddler saddler-reporter-github

  git diff -z --name-only origin/master \
   | xargs -0 rubocop-select \
   | xargs rubocop \
       --require rubocop/formatter/checkstyle_formatter \
       --format RuboCop::Formatter::CheckstyleFormatter \
   | checkstyle_filter-git diff origin/master \
   | saddler report \
      --require saddler/reporter/github \
      --reporter Saddler::Reporter::Github::PullRequestReviewComment
fi
exit 0
```

If you prefer to exec *post* `test`, you can set this. See: [Configuring CircleCI - CircleCI](https://circleci.com/docs/configuration#phases)

## Setting

[Environment variables - CircleCI](https://circleci.com/docs/environment-variables)

set your own `GITHUB_ACCESS_TOKEN`

## Contributing

1. Fork it ( https://github.com/packsaddle/example-circle_ci-pull_request_review/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
