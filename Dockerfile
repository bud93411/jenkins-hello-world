FROM tomcat:8.0.38

# Place the code version inside the webapps directory
ARG PACKAGE_VERSION
RUN echo "${PACKAGE_VERSION}" >> /usr/local/tomcat/webapps/version.txt

COPY project.war /usr/local/tomcat/webapps/project.war
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]

