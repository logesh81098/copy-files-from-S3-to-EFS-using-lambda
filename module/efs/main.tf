############################################################################################################
#                                   Creating EFS
############################################################################################################
resource "aws_efs_file_system" "project-efs" {
  creation_token = "s3-to-efs-filesystem"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  encrypted = true
  tags = {
    Name = "${var.project-name}-FileSystem"
  }
}


############################################################################################################
#                                   Creating Mount Targets
############################################################################################################
resource "aws_efs_mount_target" "mount-target-1" {
  file_system_id = aws_efs_file_system.project-efs.id
  subnet_id = var.public-subnet-1-id
  security_groups = [var.efs-sg]
}

resource "aws_efs_mount_target" "mount-target-2" {
  file_system_id = aws_efs_file_system.project-efs.id
  subnet_id = var.public-subnet-2-id
  security_groups = [var.efs-sg]
}

resource "aws_efs_mount_target" "mount-target-3" {
  file_system_id = aws_efs_file_system.project-efs.id
  subnet_id = var.public-subnet-3-id
  security_groups = [var.efs-sg]
}


