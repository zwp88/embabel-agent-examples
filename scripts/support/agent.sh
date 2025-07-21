#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENV_SCRIPT="$SCRIPT_DIR/check_env.sh"

# Call the environment check script
if [ -f "$ENV_SCRIPT" ]; then
    source "$ENV_SCRIPT"
    if [ $? -ne 0 ]; then
        echo "Environment check failed. Exiting..."
        exit 1
    fi
else
    echo "Warning: Environment check script not found at $ENV_SCRIPT"
fi

# Check if AGENT_APPLICATION environment variable is set
if [ -z "$AGENT_APPLICATION" ]; then
    echo "ERROR: AGENT_APPLICATION environment variable is NOT set"
    echo "Please set it like: export AGENT_APPLICATION=/path/to/your/project"
    exit 1
fi

# Check if MAVEN_PROFILE environment variable is set
if [ -z "$MAVEN_PROFILE" ]; then
    echo "ERROR: MAVEN_PROFILE environment variable is NOT set"
    echo "Please set it in the calling script"
    exit 1
fi

# Set the POM file path
POM_FILE="$AGENT_APPLICATION/pom.xml"

# Check if the POM file exists
if [ ! -f "$POM_FILE" ]; then
    echo "ERROR: POM file not found at $POM_FILE"
    exit 1
fi

# Display what we're running
echo "Starting application with profile: $MAVEN_PROFILE"
echo "Application path: $AGENT_APPLICATION"

# Run Maven Spring Boot application
../../mvnw -U -P "$MAVEN_PROFILE" -f "$POM_FILE" -Dmaven.test.skip=true clean spring-boot:run