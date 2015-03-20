require 'minitest/autorun'
require_relative "../../lib/backup/compressor"

class CompressorHost
  include Backup::Compressor
  def backup_filename
    "backupfile"
  end
end

describe CompressorHost do
  before do
    @compressor = CompressorHost.new
  end

  it 'should construct zip command properly' do
    @compressor.compress_command.must_equal "zip backupfile.zip backupfile"
  end

  it 'should define compressed filename properly' do
    @compressor.compressed_filename.must_equal "backupfile.zip"
  end
end
