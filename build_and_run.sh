#!/bin/bash
#mvn clean install && \
mvn package && \
java -jar target/CurrencyFairWizard-0.0.1-SNAPSHOT.jar server wizardConf.yml