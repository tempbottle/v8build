#!/bin/bash -e
if [[ ${CIRCLECI} ]]; then
  echo "export VERSION=${npm_package_version}" >> $BASH_ENV
  echo "export V8_VERSION=${npm_package_config_V8}" >> $BASH_ENV
elif [[ ${GITHUB_ACTIONS} ]]; then
  echo "::set-env name=VERSION::${npm_package_version}"
  echo "::set-env name=V8_VERSION::${npm_package_config_V8}"
else
  export VERSION=${npm_package_version}
  export V8_VERSION=${npm_package_config_V8}
fi

CWD=`pwd`
echo $CWD
ls $CWD/scripts/

chmod +x $CWD/scripts/archive.sh
chmod +x $CWD/scripts/build.sh
chmod +x $CWD/scripts/bump.py
chmod +x $CWD/scripts/env.sh
chmod +x $CWD/scripts/patch.sh
chmod +x $CWD/scripts/publish.py
chmod +x $CWD/scripts/setup.sh
chmod +x $CWD/scripts/start.sh