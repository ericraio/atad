FROM ericraio/rails

EXPOSE 8080

RUN bundle exec rake assets:precompile
RUN bundle exec rake cron:write
RUN touch /var/log/cron.log

# CMD rsyslogd && cron && tail -f /var/log/syslog /var/log/cron.log

CMD bundle exec rake db:migrate && bundle exec bin/unicorn
