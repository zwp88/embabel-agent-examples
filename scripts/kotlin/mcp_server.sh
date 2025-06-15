#!/usr/bin/env bash

export AGENT_APPLICATION=../../examples-kotlin
export SPRING_PROFILES_ACTIVE=web,severance

../support/agent.sh
