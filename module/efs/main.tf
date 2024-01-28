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


############################################################################################################
#                                   Creating Access Point
############################################################################################################
resource "aws_efs_access_point" "access-point" {
  file_system_id = aws_efs_file_system.project-efs.id
  posix_user {
    uid = "1000"
    gid = "1000"
  }
  root_directory {
    path = "/efs"
    creation_info {
      owner_uid = "1000"
      owner_gid = "1000"
      permissions = "777"
    }  
  }
  tags = {
    Name = "s3-to-efs-Access point"
  }
}