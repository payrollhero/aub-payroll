module AUB
  module Payroll
    module SummaryFile
      class HTMLGenerator

        def initialize(company_info:, payroll_info:, transactions:)
          @company_info = company_info
          @payroll_info = payroll_info
          @transactions = transactions
        end

        def generate
          Dir.mktmpdir do |dir|
            Dir.chdir(dir) do
              render 'body.slim', 'body.html'
              render 'header.slim', 'header.html'
              render 'footer.slim', 'footer.html'
              render 'style.scss', 'style.css'
              render 'clear.css', with: :copy
              render 'footer.js', with: :copy
              render 'underscore-min.js', with: :copy, from: :vendor
              yield
            end
          end
        end

        attr_reader :company_info, :payroll_info, :transactions

        private

        def format_currency(number)
          whole, decimal = format('%.2f', number).split('.')
          whole.split(//).reverse.in_groups_of(3).map(&:reverse).map(&:join).reverse.join(',') + ".#{decimal}"
        end

        def template_file_path(name)
          GEM_ROOT + "/lib/aub/payroll/summary_file/templates/#{name}"
        end

        def render_tilt_template(template_path)
          Tilt.new(template_path).render(self)
        end

        def render(template, output = template, with: :tilt, from: :templates)
          source_path = resolve_source(from, template)
          body = render_body(source_path, with)

          File.open(output, 'w') { |fh| fh.write(body) }
        end

        def render_body(source_path, with)
          case with
          when :tilt
            render_tilt_template(source_path)
          when :copy
            File.read(source_path)
          else
            raise "unhandled engine: #{with.inspect}"
          end
        end

        def resolve_source(from, template)
          case from
          when :templates
            template_file_path(template)
          when :vendor
            GEM_ROOT + "/vendor/#{template}"
          else
            raise "unhandled source: #{from.inspect}"
          end
        end
      end
    end
  end
end
