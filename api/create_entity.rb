require_relative "responser.rb"
require 'net/http'
require 'json'

module CreateEntity
  def self.create_repository(owner, repos_name,token)
    uri = URI.parse("https://api.github.com/user/repos")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(owner, token)
    request.body = {"name" => repos_name}.to_json
    
    JSON.parse(responser(uri, request).body)
  end

  def self.create_branch(owner, repos_name, new_branch_name, from_branch_name, token)
    uri = URI.parse("https://api.github.com/repos/#{owner}/#{repos_name}/git/refs")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(owner, token)
    new_branch_name = "refs/heads/" + new_branch_name
    request.body = {
        "ref" => new_branch_name,
        "sha" => from_branch_name
    }.to_json
    
    JSON.parse(responser(uri, request).body)
  end

  def self.create_pull(owner, repos_name, head_branch_name, base_branch_name, title, token)
    uri = URI.parse("https://api.github.com/repos/#{owner}/#{repos_name}/pulls")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(owner, token)
    request.body = {
        "head" => head_branch_name,
        "base" => base_branch_name,
        "title" => title
    }.to_json
    
    JSON.parse(responser(uri, request).body)
  end
end