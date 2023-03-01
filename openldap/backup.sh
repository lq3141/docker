#/bin/bash
docker run --rm --volume openldap_data:/openldap_data --volume $(pwd):/tmp_tar ubuntu:jammy tar zcf /tmp_tar/openldap_data-$(date +%Y%m%d_%H%M).tar.gz /openldap_data
