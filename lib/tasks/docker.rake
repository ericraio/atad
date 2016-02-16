namespace :docker do
  task :deploy => ['docker:prepare', 'docker:build', 'docker:publish']
  task :publish => ['docker:push', 'docker:clean']

  task :build do
    sh 'docker build -t "atad/atad" .'
  end

  task :push do
    sh 'docker tag atad/atad:latest ericraio/atad:latest'
    sh 'docker push ericraio/atad:latest'
  end

  task :clean do
    sh 'say update completed'
    sh 'docker rmi -f ericraio/atad'
    sh 'bin/docker-clean images'
    sh 'echo y | bin/docker-clean containers'
  end

  task :prepare do
    Bundler.with_clean_env do
      sh 'bundle package'
    end
  end
end
