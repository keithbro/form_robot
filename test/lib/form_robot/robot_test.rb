require_relative '../../test_helper'

describe Robot do
    robot = Robot.new

    it 'must be able to do a Google search' do
        instructions = {
            'go_to_url' => 'http://www.google.com',
            'enter_params' => {
                'q' => 'RubyGems',
            },
            'look_for_text' => 'rubygems.org',
        };
        robot.carry_out(instructions)
        assert robot.was_successful
    end

    it 'must be able to handle multiple instructions' do
        instructions = [{
            'go_to_url' => 'http://www.linkedin.com/',
            'enter_params' => {
                'first' => 'Keith',
                'last' => 'Broughton',
            },
            'look_for_text' => 'Republic of Ireland',
        }, {
            'go_to_url' => 'https://github.com/',
            'enter_params' => {
                'q' => 'mongoid',
            },
            'look_for_text' => 'Ruby ODM framework for MongoDB',
        }];
        robot.carry_out(instructions)
        assert robot.was_successful
    end
end
