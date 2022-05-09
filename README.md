

# Ansible Events Execution Environment

This is an Ansible execution environment that contains the
ansible-events command line tool and some collections that
provide events sources for ansible-events.

Use this execution environment to get started with ansible-events
quickly.

You can pull this EE from using:

    docker pull quay.io/bthomass/ansible-events


To run the example `hello_events.yml` use the following command:

	docker run -it quay.io/bthomass/ansible-events:latest ansible-events --rules benthomasson.eda.hello_events -i inventory.yml


The hello events example is contained in this collection:

    https://github.com/benthomasson/benthomasson-eda/



Ansible Events cane be found here:

    https://github.com/benthomasson/ansible-events
