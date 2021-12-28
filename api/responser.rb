def responser(uri, request)
    req_options = {
      use_ssl: uri.scheme == "https",
    }
  
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  
    return response
end
