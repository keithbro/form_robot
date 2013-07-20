require_relative '../../test_helper'

require 'json'

describe Robot do
    r = Robot.new

    it 'must be able to read data parsed from JSON' do
        json = '{
            "instructions": [
                {
                    "go_to_url": "http://www.google.com",
                    "enter_params": {
                        "q": "Ruby on Rails"
                    }
                },
                {
                    "enter_params": {
                        "q": "Perl Dancer"
                    }
                }
            ]
        }'
        instructions = JSON.parse(json)
        r.carry_out(instructions['instructions'])
        assert_match( /www\.perldancer\.org/, r.last_response )
    end
end
