class Redirect
  def initialize(target:, status:)
    @target = target
    @status = status
  end

  def call(env)
    request = Rack::Request.new(env)
    location = URI.join(@target, request.fullpath).to_s

    [@status, {'Location' => location}, []]
  end
end
