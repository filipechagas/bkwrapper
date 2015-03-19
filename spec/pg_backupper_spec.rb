require 'minitest/autorun'
require 'minitest/mock'
require_relative "../lib/pg_backupper"

describe PgBackupper do
  before do
    @test_project_name = "testproject"
    @db_username = "username"
    @db_password = "password"
    @db_name = "database"
    @backup_filename = "xxx-#{@test_project_name}.backup"
    @pg_backupper = PgBackupper.new(@test_project_name, @db_username, @db_password, @db_name)
  end

  it 'should construct the right filename' do
    @pg_backupper.stub :prefix, "xxx" do
      @pg_backupper.backup_filename.must_equal @backup_filename
    end
  end

  it 'should construct command properly' do
    @pg_backupper.stub :prefix, "xxx" do
      @pg_backupper.backup_command.
        must_equal "PGPASSWORD=#{@db_password} pg_dump -U #{@db_username} -Fc #{@db_name} > #{@backup_filename}"
    end
  end
end
