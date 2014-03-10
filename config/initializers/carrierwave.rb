CarrierWave.configure do |config|

  config.cache_dir = File.join(Rails.root, 'tmp', 'uploads')

  case Rails.env.to_sym

  when :development
    config.storage = :file
    config.root = File.join(Rails.root, 'public')

  when :production
    # the following configuration works for Amazon S3
    config.storage          = :fog
    config.fog_credentials  = {
      provider:                 'AWS',
      aws_access_key_id:        ENV['AKIAJH774J5VMJRDKWDA'],
      aws_secret_access_key:    ENV['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'],
      region:                   ENV['us-east-1']
    }
    config.fog_directory    = ENV['portfolio01730']

  else
    # settings for the local filesystem
    config.storage = :file
    config.root = File.join(Rails.root, 'public')
  end

end