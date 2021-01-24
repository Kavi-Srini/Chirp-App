# Aws.config.update({
#   region: 'us-east-1',
#   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
# })

# S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])


S3Client = Aws::S3::Client.new(
    access_key_id: 'ACCESS_KEY_ID',
    secret_access_key: 'SECRET_ACCESS_KEY',
    region: 'us-east-1'
) 