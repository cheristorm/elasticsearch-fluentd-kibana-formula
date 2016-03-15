kibana-repo:
  pkgrepo:
    - managed
    - humanname: Kibana Repository
    - name: deb http://packages.elastic.co/kibana/4.4/debian stable main
    - file: /etc/apt/sources.list.d/kibana.list
    - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch

kibana:
  pkg.installed:
    - fromrepo: kibana-repo