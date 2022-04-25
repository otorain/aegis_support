require "factory_bot"

RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods

    # if without this line, the definitions of FactoryBot would not be loaded. I don't know if it's a bug
    FactoryBot.find_definitions
end
