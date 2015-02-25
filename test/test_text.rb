require_relative 'helper'

module Example
  module CircleCi
    module PullRequestReview
      class TestExample  < Test::Unit::TestCase
        test 'version' do
          assert do
            !::Example::CircleCi::PullRequestReview::VERSION.nil?
          end
        end
      end
    end
  end
end
