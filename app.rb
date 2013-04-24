require 'rack/contrib'
require 'rack/contrib/try_static'

not_found = lambda { |env| [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, ["Not Found"]] }
App = Rack::TryStatic.new not_found,
  :urls => ['/'],
  :root => 'public',
  :try => ['.html', 'index.html', '/index.html']


require 'terminus'
require 'capybara'

def driver
  Capybara.current_session.driver
end

Thread.new do
  Capybara.current_driver = :terminus
  Capybara.app = App
  Terminus.browser = :docked
end
