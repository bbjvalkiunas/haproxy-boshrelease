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
        'ha_proxy' => {
          'log_level' => 'debug',
          'threads' => 5
        }
      )

      File.write('./output', tpl_output)

    end
  end
end
