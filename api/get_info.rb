require_relative "responser.rb"

module GetInfo
  def self.get_info(owner, repo, password, info_type = nil)
    uri = URI.parse("https://api.github.com/repos/#{owner}/#{!info_type.nil? ? "#{repo}/#{info_type}" : "#{repo}"}")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(owner, password)

    JSON.parse(responser(uri, request).body)
  end
end