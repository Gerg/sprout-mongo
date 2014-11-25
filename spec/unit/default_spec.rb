require 'unit/spec_helper'

describe 'sprout-mongo::default' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'includes all other recipes' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-mongo::install_mongo')
    expect(runner).to include_recipe('sprout-mongo::add_launch_agent')
  end
end
