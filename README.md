This is Intra Region VPC Peering Assignment-02, which is about the CLI-driven workflow (remote) with multiple workspaces and showing state dependencies among workspaces. Also includes VPC peering flows and private/public instances creations. 

### Remote-Exec Is Not Idempotent (Ko Sai)
* Terraform provisioners do not maintain state: each apply or taint triggers all commands exactly as written.
* Most shell commands (such as apt install, unzip, and file removals) do not check if actions are needed.
* This can lead to unnecessary reinstallation of packages and redundant operations on each run.
* Make shell scripts resilient by checking for pre-existing files, packages, and installations.
* Use logical conditions (if, checks) in commands to skip steps if already complete.
* Prefer configuration management tools (Ansible, Chef, etc.) for advanced idempotency.
* We're using a little trick here so we can run the provisioner without destroying the VM. Do not do this in production.
* If you need ongoing management (Day N) of your virtual machines a tool such as Chef or Puppet is a better choice. 
* These tools track the state of individual files and can keep them in the correct configuration.

####################################################################################################################
### Simple Git Repo
git clone -b aws-vpc-peering-intra --single-branch https://gitlab.com/sailinnthu/terraform-aws-bastion-host.git ref_vpc_peering/

####################################################################################################################
### Architecture 
- 2 VPC --> fe_vpc, be_vpc
- 1 public route table (IGW)
- private route table 1 (NAT)
- private route table 2&3 (Local)
- 1 public instance (amazon)
- 3 private instance (ubuntu)

####################################################################################################################
### CLI Driven Workflow | Remote Execution
- 7 Workspaces | 7 folers
- fe_network, fe_sgp, fe_compute
- be_network, be_sgp, be_compute
- vpc_peering

####################################################################################################################
### Frontend Security Group
- pub-sgp01
Inbound Rules
* Allow Only Your IP to be able to ping to public-instance-01(hc-frontend-vpc)
* Allow Only Your IP to be able to SSH to public-instance-01(hc-frontend-vpc)

Outbound Rules
* Allow ALL Types of traffic to the destination 0.0.0.0/0

- pri-sgp01
Inbound Rules
* Allow Only pub-sgp-01 to be able to ping to private-instance-01(hc-frontend-vpc)
* Allow Only pub-sgp-01 to be able to SSH to private-instance-01(hc-frontend-vpc)

Outbound Rules
* Allow ALL Types of traffic to the destination 0.0.0.0/0


- pri-sgp02
Inbound Rules
* Allow Only FROM pri-sgp-01(hc-frontend-vpc) to be able to ping TO private-instance-02(hc-frontend-vpc)
* Allow Only FROM pri-sgp-01(hc-frontend-vpc) to be able to SSH TO private-instance-02(hc-frontend-vpc)
* Allow Only FROM pri-sgp-02(hc-backend-vpc) to be able to ping TO private-instance-02(hc-frontend-vpc)
* Allow Only FROM pri-sgp-02(hc-backend-vpc) to be able to SSH TO private-instance-02(hc-frontend-vpc)

Outbound Rules
* Allow Only to be able to ping TO private-instance-02(hc-backend-vpc)
* Allow Only to be able to SSH TO private-instance-02(hc-backend-vpc) 

- pri-sgp03
Inbound Rules
* Allow Only FROM pri-sgp-01(hc-frontend-vpc) to be able to ping TO private-instance-03(hc-frontend-vpc)
* Allow Only FROM pri-sgp-01(hc-frontend-vpc) to be able to SSH TO private-instance-03(hc-frontend-vpc)
* Allow Only FROM pri-sgp-03(hc-backend-vpc) to be able to ping TO private-instance-03(hc-frontend-vpc)
* Allow Only FROM pri-sgp-03(hc-backend-vpc) to be able to SSH TO private-instance-03(hc-frontend-vpc)

Outbound Rules
* Allow Only to be able to ping TO private-instance-03(hc-backend-vpc)
* Allow Only to be able to SSH TO private-instance-03(hc-backend-vpc) 

####################################################################################################################
### Backend Security Group
- pub-sgp01
Inbound Rules
* Allow Only Your IP to be able to ping to public-instance-01(hc-backend-vpc)
* Allow Only Your IP to be able to SSH to public-instance-01(hc-backend-vpc)

Outbound Rules
* Allow ALL Types of traffic to the destination 0.0.0.0/0

- pri-sgp01
Inbound Rules
* Allow Only pub-sgp-01 to be able to ping to private-instance-01(hc-backend-vpc)
* Allow Only pub-sgp-01 to be able to SSH to private-instance-01(hc-backend-vpc)

Outbound Rules
* Allow ALL Types of traffic to the destination 0.0.0.0/0

- pri-sgp02
Inbound Rules
* Allow Only FROM pri-sgp-01(hc-backend-vpc) to be able to ping TO private-instance-02(hc-backend-vpc)
* Allow Only FROM pri-sgp-01(hc-backend-vpc) to be able to SSH TO private-instance-02(hc-backend-vpc)
* Allow Only FROM pri-sgp-02(hc-frontend-vpc) to be able to ping TO private-instance-02(hc-backend-vpc)
* Allow Only FROM pri-sgp-02(hc-frontend-vpc) to be able to SSH TO private-instance-02(hc-backend-vpc)

Outbound Rules
* Allow Only to be able to ping TO private-instance-02(hc-frontend-vpc)
* Allow Only to be able to SSH TO private-instance-02(hc-frontend-vpc) 

- pri-sgp03
Inbound Rules
* Allow Only FROM pri-sgp-01(hc-backend-vpc) to be able to ping TO private-instance-03(hc-backend-vpc)
* Allow Only FROM pri-sgp-01(hc-backend-vpc) to be able to SSH TO private-instance-03(hc-backend-vpc)
* Allow Only FROM pri-sgp-03(hc-frontend-vpc) to be able to ping TO private-instance-03(hc-backend-vpc)
* Allow Only FROM pri-sgp-03(hc-frontend-vpc) to be able to SSH TO private-instance-03(hc-backend-vpc)

Outbound Rules
* Allow Only to be able to ping TO private-instance-03 (hc-frontend-vpc)
* Allow Only to be able to SSH TO private-instance-03 (hc-frontend-vpc)

####################################################################################################################
### NOTE


* To apply the resources in serial of dependencies  (fe_network => fe_sgp => fe_compute)
* To destroy the resources in backwards (fe_compute => fe_sgp => fe_network)
* To command out (#) for dependent resources between tight dependent workspaces before apply and destroy


![alt text](image.png)