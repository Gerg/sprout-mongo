require 'unit/spec_helper'

describe 'sprout-mongo::install_mongo' do
  let(:runner) { ChefSpec::Runner.new }
  let(:mongo_data_dir) { '/usr/local/var/mongodb' }
  let(:preserve_dbs) { false }

  before do
    stub_command('which git')
    runner.node.set['sprout']['mongo']['preserve_dbs'] = preserve_dbs
    runner.converge(described_recipe)
  end

  it 'installs homebrew if needed' do
    expect(runner).to include_recipe('homebrew')
  end

  it 'installs the mongo homebrew formula' do
    expect(runner).to install_package('mongo')
  end

  it 'recreates the data directory to ensure databases are UTF8 encoded' do
    expect(runner).to delete_directory(mongo_data_dir).with_recursive(true)
    expect(runner).to create_directory(mongo_data_dir)
  end

  context 'when there were dbs before installing mongo with brew' do
    let(:preserve_dbs) { true }

    it 'does not recreate the data directory' do
      expect(runner).not_to delete_directory(mongo_data_dir)
      expect(runner).not_to create_directory(mongo_data_dir)
    end
  end
end
