resource "aws_eks_cluster" "devopsthehardway-eks" {
 name = "devopsthehardway-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
  subnet_ids = [aws_subnet.eks_public_subnet.id, aws_subnet.eks_private_subnet.id]
 }
 

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}