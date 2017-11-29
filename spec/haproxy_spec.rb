require 'rspec'
require 'json'
require 'yaml' # todo fix bosh-template
require 'bosh/template/test'

describe 'haproxy job' do
  let(:release) { Bosh::Template::Test::ReleaseDir.new(File.join(File.dirname(__FILE__), '..')) }
  let(:job) { release.job('haproxy') }

  describe 'haproxy.config template' do
    let(:template) { job.template('config/haproxy.config') }

    it 'generates config from manifest properties' do
      tpl_output = template.render(
        'haproxy' => [{
          'backend_port' => '8080808080',
          'log_level' => 'debug'
        }]
      )

      pp tpl_output

    end
  end
end
