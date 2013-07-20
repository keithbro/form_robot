require_relative '../../test_helper'

describe Robot do
    robot = Robot.new

    it 'must give a UTF-8 response' do
        instructions = {
            go_to_url: 'http://www.google.com',
            enter_params: {
                'q' => 'broughton',
            },
        };
        robot.carry_out(instructions)
        assert_equal robot.last_response.encoding.name, 'UTF-8'
    end
end
