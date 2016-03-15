openjdk-7-jre-headless:
  pkg:
    - installed

elasticsearch:
  pkg.installed:
    - sources:
      - elasticsearch: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-2.2.0.deb
    - require:
      - pkg: openjdk-7-jre-headless
    - unless: ls /usr/sbin/elasticsearch

elasticsearch:
  service.running:
    - require:
      - pkg: elasticsearch