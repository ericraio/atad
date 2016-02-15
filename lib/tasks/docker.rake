namespace :docker do
  task :deploy => ['docker:prepare', 'docker:build', 'docker:publish']
  task :publish => ['docker:push', 'docker:clean']

  task :build do
    sh 'docker build -t "carsocial/carsocial-api" .'
  end

  task :push do
    sh 'docker tag carsocial/carsocial-api:latest tutum.co/ericraio/carsocial-api:latest'
    sh 'docker push tutum.co/ericraio/carsocial-api:latest'
  end

  task :clean do
    sh 'say update completed'
    sh 'docker rmi -f tutum.co/ericraio/carsocial-api'
    sh 'bin/docker-clean images'
    sh 'echo y | bin/docker-clean containers'
  end

  task :prepare do
    Bundler.with_clean_env do
      sh 'bundle package'
    end
  end
end
