

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


The hello events example is contained in this collection: https://github.com/benthomasson/benthomasson-eda/



Ansible Events cane be found here: https://github.com/benthomasson/ansible-events

## Make changes and build a new image

### Use a local collection
To test a local collection before publishing to a galaxy you can configure it in the requirements.yml:

	---
	collections:
  	  - community.general
	  - name: benthomasson.eda
	    source: path/benthomasson-eda-1.2.2.tar.gz
	    type: file

Add any python dependencies required by the collection in the requirements.txt.

Ideally you should be able to select a commit or branch of the ansible-events git repository:

	git+https://github.com/benthomasson/ansible-events.git@<commit or branch>#egg=ansible-events

Unforfortunately due to a bug in ansible-builder the commit or branch is always ignored. The above git reference always points to the latest release tag of the main branch.

### Build a new execution environment image locally
Run the build:

	ansible-builder build --tag benthomasson/eda-ee --container-runtime docker

Test rules from the local image:

	docker run -it benthomasson/eda-ee:latest ansible-events --rules benthomasson.eda.hello_events -i inventory.yml
	
