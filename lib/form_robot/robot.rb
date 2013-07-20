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
            @was_successful
        end
    end

    def last_response
        @mech.page.header.to_s + @mech.page.parser.to_s
    end

    private
        def carry_out_single ( args = {} )
            page = args.has_key?( 'go_to_url' ) ? @mech.get( args['go_to_url'] ) : @mech.page
            form_with_params = page.forms.detect do |form|
                args['enter_params'].keys.all? do |key|
                    form.keys.include? key
                end
            end
            form_with_params.set_fields( args['enter_params'] )
            form_with_params.submit

            args.has_key?( 'look_for_text' ) ? @mech.page.parser.to_s.match( args['look_for_text'] ) : true
        end
end
