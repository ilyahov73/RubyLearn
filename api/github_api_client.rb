require "net/http"
require "uri"
require "json"
require_relative "responser.rb"
require_relative "get_info.rb"
require_relative "create_entity.rb"

class GitHubClient
  def self.get_info_about_user(name, password)
    uri = URI.parse("https://api.github.com/users/#{name}")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(name, password)

    JSON.parse(responser(uri, request).body)
  end
end

#puts GetInfo.get_info("ilyahov73", "RubyLearn", "59ugagil", "pulls")
puts CreateEntity.create_pull("ilyahov73", "RubyLearn","test_branch_for_api_task", "Task1","test_pull", "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")
