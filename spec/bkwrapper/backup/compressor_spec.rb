require 'minitest/autorun'
require "bkwrapper/backup/compressor"

class CompressorHost
  include Bkwrapper::Backup::Compressor
  def backup_filename
    "backupfile"
  end
end

describe CompressorHost do
  before do
    @compressor = CompressorHost.new
  end

  it 'should construct zip command properly' do
    @compressor.compress_command.must_equal "zip /var/tmp/backupfile.zip /var/tmp/backupfile"
  end

  it 'should define compressed filename properly' do
    @compressor.compressed_filename.must_equal "backupfile.zip"
  end
end
