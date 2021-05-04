#!/bin/bash
#
#
if [[ "$1" == "--version" ]]
then
docker-compose -f docker-compose_eps_dispenser_simulator.yml run --rm tkw_eps_dispenser_simulator $1
	exit 0
else
	if [[ "$1" == "-d" ]]
	then
	docker-compose -f docker-compose_eps_dispenser_simulator.yml up -d
	else
		docker-compose -f docker-compose_eps_dispenser_simulator.yml up
	fi
fi
