import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'


def test_postgres_running_and_enabled(host):
    if host.system_info.distribution == 'centos':
        assert not host.ansible(
            "service",
            "name=postgresql-9.6 enabled=true state=started")['changed']
    if host.system_info.distribution == 'debian':
        assert not host.ansible(
            "service",
            "name=postgres enabled=true state=started")['changed']
