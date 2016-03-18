{% set os = grains['os'] %}
{% set oscodename = grains['oscodename'] %}

fluentd-repo:
  pkgrepo:
    - managed
    - humanname: Fluentd Repository
    - name: deb http://packages.treasuredata.com/2/{{ os }}/{{ oscodename }}/ {{ oscodename }} contrib
    - file: /etc/apt/sources.list.d/fluentd.list
    - key_url: https://packages.treasuredata.com/GPG-KEY-td-agent

fluentd:
  pkg.installed:
    - name: td-agent
    - fromrepo: fluentd-repo