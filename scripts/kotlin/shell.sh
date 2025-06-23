#!/usr/bin/env bash

export AGENT_APPLICATION=../../examples-kotlin
export MAVE_PROFILE=enable-mcp

../support/check_env.sh

cd ../../examples-kotlin
export SPRING_PROFILES_ACTIVE=shell,starwars,docker-desktop
mvn -P $MAVE_PROFILE -Dmaven.test.skip=true spring-boot:run