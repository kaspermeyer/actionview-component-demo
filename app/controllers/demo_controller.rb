class DemoController < ApplicationController
  def index
  end

  def show
    Issue.all.each do |issue|
      if issue.pull_request
        render(PullRequests::Badge.new(state: issue.pull_request.state.to_sym, is_draft: issue.pull_request.draft?))
      else
        render(Issues::Badge.new(state: issue.state.to_sym))
      end
    end
  end
end
