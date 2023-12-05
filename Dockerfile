FROM apachekylin/apache-kylin-standalone:5.0-beta
COPY ./conf/hive/hive-site.xml /opt/apache-hive-3.1.2-bin/conf/hive-site.xml
COPY ./conf/kylin/entrypoint.sh /home/kylin/entrypoint.sh
RUN chmod +x /home/kylin/entrypoint.sh
ENTRYPOINT ["/home/kylin/entrypoint.sh"]