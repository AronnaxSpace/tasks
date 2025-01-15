server '194.99.21.141', user: 'deploy', roles: %w{app db web}

set :deploy_to, '/home/deploy/staging/tasks'
set :branch, 'staging'
