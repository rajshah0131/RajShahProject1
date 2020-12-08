### RajShahProject1
Linux, Scripts, diagrams for Project 1

The files in this repository were used to configure the network depicted below

1. Network Diagram Without ELK Server
![Network Diagram Without ELK Server](https://github.com/rajshah0131/RajShahProject1/blob/main/Diagram/Raj%20Shah%20homework%2012.png "Network Diagram Without ELK Server")

2. Network diagram With ELK Server
![Network Diagram With ELK Server](https://github.com/rajshah0131/RajShahProject1/blob/main/Diagram/Diagram%20of%20Complete%20Network.png "Network Diagram With ELK Server")

-these files have been tested and used to generate a live ELK deployment on azure. they can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ELK file may be used to install only certain pieces of it 

 -![Ansible Cfg](https://github.com/rajshah0131/RajShahProject1/blob/main/Ansible/Ansible-CFg/Ansible-Cfg "Ansible Cfg")
 
 -![Ansible Hosts](https://github.com/rajshah0131/RajShahProject1/blob/main/Ansible/Ansible-CFg/hosts "Ansible Hosts")
 
 -![DVWA](https://github.com/rajshah0131/RajShahProject1/blob/main/Ansible/DVWA/install-DVWA.yml "DVWA")
 
 -![ELK](https://github.com/rajshah0131/RajShahProject1/blob/main/Ansible/ELK/install-ELK.yml "ELK")
 
 -![Filebeat](https://github.com/rajshah0131/RajShahProject1/blob/main/Ansible/Filebeat/filebeat-playbook.yml "filebeat")
 
 -![Metricbeat](https://github.com/rajshah0131/RajShahProject1/blob/main/Ansible/Metricbeat/metricbeat-playbook.yml "metricbeat")

This document will show the following:
- Description of the topology
- Access Policies
- ELK Configuration
 - Beats in USE
 - Machines Being Monitored
- How to use the Ansible Build

### Topology
- The main purpose of this network is to expose a load-balanded and monitored instance of DVWA, which stands for D**n Vulnerable Web Application

- Load balancing ensures that the application will be highly efficient, in addition to restricting access to the network. 
 - Load balancers have a health probe that helps find random traffic that is usually not suppose to be there. Along with this is allows the server to have nice speed and the ability to recover if failed.
 - The advantage of a jump box is so all servers that one may want in a resource group can be connected to a single server. all the codes and containers will be inside the jumpbox allowing for a more secure network
 
- Integrating an EK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic
 - Filebeat is a tool that allows one to monitor audit logs, deprecation logs, pc logs, server logs and slow logs
 - Metricbeat is a tool that allows one to collect metrics from the OS and form services that can run on a server
 
- The configuration details of each machine are listed below

| Name      | Function | IP Address  | Operating System  |
| --------- | -------- | ----------- | ----------------- |
| Jump Box  | Gateway  | 10.0.0.4    | Linux             |
| Web-1     | DVWA     | 10.0.0.9    | Linux             |
| Web-2     | DVWA     | 10.0.0.10   | Linux             |
| RedElk    | Sybr     | 10.1.0.4    | Linux             |

### Access Policies

- The Machines on the internal network are not exposed to the public Internet.

- Only the Jump Box machine can accept connections from the internet
 - Access to this machine is only allowed from the following IP address:
   - 98.222.136.51

- Machines with the network can only be accessed by 98.222.136.51
 - This machine is my physical machines public IP address: 98.222.136.51
 
- A summary of the access policies in place can be found in the table below

| Name      | Public Accessible  | Allowed IP Addresses  |
| --------- | ------------------ | --------------------- |
| Jump Box  | Yes                | 98.222.136.51         |
| Web-1     | No                 | 52.152.128.132        |
| Web-2     | No                 | 52.152.128.132        |
| RedElk    | Yes                | 98.222.136.51         |

### Elk Configuration

- Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible is a free open-source tool that is extremely powerful because it can model highly complex IT workflow. It allows the user to not have to spend time on unnecessary cleaning and can focus on business

- The playbook implements the following tasks
 - Install Docker
 - Install pip3
 - Install docker python module
 - Use more memory
 - download and launch a docker elk container
 
 ![screenshot of working ELK server] (https://drive.google.com/file/d/1VrCbh1Fx1-AKNtUqrTYoGBlKGAZGT3VX/view?usp=sharing "ELK Server")
 
 ### Target Machines and Beats

- This ELK server is ocnfigured to monitor the following machines

| Name      | IP Address  |   
| --------- | ----------- | 
| Jump Box  | 10.0.0.4    | 
| Web-1     | 10.0.0.9    | 
| Web-2     | 10.0.0.10   | 
| RedElk    | 10.1.0.4    | 

We have installed the following Beats on these machines:
- Metricbeat
- Filebeat

These Beats allow us to collect the following information from each machine:
- Metricbeat - Metricbeat will collect metrics and statistics from the operating system.
- Filebeat - Filebeat will collected audit logs, deprecation logs, pc logs, server logs, and slow logs to be viewed inside specificied path

Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

-SSH into the control node and follow the steps below: filebeat
 - Run: curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat 
 
 - Update the filebeat-config.yml to include your 
- output.elasticsearch:
  - host: "10.1.0.4:9200"
  - username: "elastic"
  - password" "changeme"
- setup.kibana:
  - "10.1.0.4:5601"
 - Run the playbook, and navigate to (ELK IP):5601/app/kibana to see if kibana is up and running
 
 -SSH into the control node and follow the steps below: metricbeat
  - Run: curl https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.10.0-amd64.deb

  - follow the same steps as for filebeats above 
   - lines 102-108
 
 - THe file in the playbook will be located in /etc/ansible and will be put in a file that you will create called files
  - Then copy it into the hosts file
 - The file that you will update will be called Metricbeat-config.yml and Filebeat-config.yml
  - the proper place to download will be located in the hosts file. You will create groups of IP addresses where you can easily download certain installations in certain places.

Lastly, if you want to make sure that your ELK server is up and running navigate to 
(elk server ip address):5601/app/kibana
- example. 40.77.90.233:5601/app/kibana
