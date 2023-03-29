# terraform_eks_salvar

**eks.tf**
In the eks.tf file the code will create the eks cluster with the roles attached to it and the vpc config where I put the private and publick subnet that I have created in network.tf

**iam.tf**
In this terraform code I will be creating iam roles and iam policies where I will input them inside the wokernodes.tf that will create instances.

--AmazonEKSClusterPolicy
---This policy provides Kubernetes the permissions it requires to manage resources on your behalf. Kubernetes requires Ec2:CreateTags permissions to place identifying information on EC2 resources including but not limited to Instances, Security Groups, and Elastic Network Interfaces.

--AmazonEC2ContainerRegistryReadOnly-EKS
---Provides read-only access to Amazon EC2 Container Registry repositories

--AmazonEKSWorkerNodePolicy
---This policy allows Amazon EKS worker nodes to connect to Amazon EKS Clusters. 

--AmazonEKS_CNI_Policy
---This policy provides the Amazon VPC CNI Plugin (amazon-vpc-cni-k8s) the permissions it requires to modify the IP address configuration on your EKS worker nodes. This permission set allows the CNI to list, describe, and modify Elastic Network Interfaces on your behalf.

--AmazonEC2ContainerRegistryReadOnly
---Provides read-only access to Amazon EC2 Container Registry repositories

--EC2InstanceProfileForImageBuilderECRContainerBuilds
---Grants full access to Image Builder resources for the role it's attached to, allowing the role to list, describe, create, update, and delete Image Builder resources.

**main.tf**
Here in main.tf I just put the provider which aws where we use it to deploy the EKS

**network.tf**
Creating security groups, NAT, NAT gateway,Subnets both public and private, route table and route table association. The NAT is needed because the code will get an error if the private subnet has no NAT gateway and security group with the port 65535 which is a reserved port.

**workernodes.tf**
Creating 3 instances that will be included in the eks cluster, the instance type is t2.micro and it depends on the policies that I have created in iam.tf file.

**WHAT TO DO**
-Download the kubectl cli so that we can see the nodes using cli use the (curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl") command to download the kubectl cli

-To check if kubectl is downloaded use the "echo "$(cat kubectl.sha256)  kubectl" | sha256sum –check" command.

-After checking the download, install the kubectl by using "sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl"

-To connect you kubectl in aws use the "aws eks –region <region> update-kubeconfig –name <EKS cluster name>" command.

-After connecting your kubectl use the "kubectl get nodes" command to check the instances that is included in the cluster.
