{% set os = grains['os'] | lower %}
{% set oscodename = grains['oscodename'] %}

fluentd-repo:
  pkgrepo:
    - managed
    - humanname: Fluentd Repository
    - name: deb http://packages.treasuredata.com/2/{{ os }}/{{ oscodename }}/ {{ oscodename }} contrib
    - file: /etc/apt/sources.list.d/fluentd.list
    - key_url: https://packages.treasuredata.com/GPG-KEY-td-agent

install-fluentd:
  pkg.installed:
    - name: td-agent
    - require:
      - pkgrepo: fluentd-repo
    - unless: ls /usr/sbin/td-agent

td-agent:
  service.running:
    - require:
      - pkg: install-fluentd