FROM taller/php7-node

COPY ./000-default.conf /etc/apache2/sites-available/

### IMPORT FILES TO ENVIRONMENT
COPY ./entrypoint.sh /etc/entrypoint.sh
RUN sudo chmod +x /etc/entrypoint.sh

CMD ["/bin/bash"]
ENTRYPOINT ["/etc/entrypoint.sh"]
