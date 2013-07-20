class Robot
    attr_reader :was_successful, :failure_reason

    def initialize
        @mech = Mechanize.new
        @mech.user_agent_alias = 'Mac Safari'
        @was_succesful = false
    end

    def carry_out ( instructions )
        if instructions.kind_of?(Array)
            instructions.all? { |i| carry_out(i) }
        else
            task = instructions
            @was_successful = carry_out_single( task )
            @failure_reason = 'Unable to ' + ( task[:description] || 'perform task' ) unless @was_successful
        end
    end

    def last_response
        @mech.page.header.to_s + @mech.page.parser.to_s
    end

    private
        def carry_out_single ( go_to_url: nil, enter_params: {}, look_for_text: nil, description: nil )
            form_with_params = @mech.get( go_to_url ).forms.detect do |form|
                enter_params.keys.all? do |key|
                    form.keys.include? key
                end
            end
            form_with_params.set_fields( enter_params )
            form_with_params.submit

            @mech.page.encoding = 'utf-8'
            look_for_text ? @mech.page.parser.to_s.match(look_for_text) : true
        end
end
