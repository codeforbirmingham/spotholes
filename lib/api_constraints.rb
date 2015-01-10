class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:version]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.potholes.v#{@version}")
  end
end