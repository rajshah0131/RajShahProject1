# RajShahProject1
Linux, Scripts, diagrams for Project 1

The files in this repository were used to configure the network depicted below

1. Network Diagram Without ELK Server
![Network Diagram Without ELK Server] (https://github.com/rajshah0131/RajShahProject1/blob/main/Diagram/Raj%20Shah%20homework%2012.png "Network Diagram Without ELK Server")

2. Network diagram With ELK Server
![Network Diagram With ELK Server] (https://github.com/rajshah0131/RajShahProject1/blob/main/Diagram/Diagram%20of%20Complete%20Network.png "Network Diagram With ELK Server")

thse files have been tested and used to generate a live ELK deployment on azure. they can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ELK file may be used to install only certain pieces of it 
![Ansible Playbook] (https://github.com/rajshah0131/RajShahProject1/tree/main/Ansible "Ansible Playbooks")

This document will show the following:
- Description of the topology
- Access Policies
- ELK Configuration
 - Beats in USE
 - Machines Being Monitored
- How to use the Ansible Build

Topology
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

Access Policies

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

Elk Configuration

- Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible is a free open-source tool that is extremely powerful because it can model highly complex IT workflow. It allows the user to not have to spend time on unnecessary cleaning and can focus on business

- The playbook implements the following tasks
 - Install Docker
 - Install pip3
 - Install docker python module
 - Use more memory
 - download and launch a docker elk container
 
 ![screenshot of working ELK server] (https://drive.google.com/file/d/1H5bUZQtW93crLsF40gQbbGKE2bnC8ysh/view?usp=sharing "ELK Server")
